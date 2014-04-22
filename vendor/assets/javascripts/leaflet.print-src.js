/*
	Leaflet.print, implements the Mapfish print protocol allowing a Leaflet map to be printed using either the Mapfish or GeoServer print module.
	(c) 2013, Adam Ratcliffe, GeoSmart Maps Limited
*/
(function (window, document, undefined) {
/* global L:false, $:false */

L.print = L.print || {};

L.print.Provider = L.Class.extend({

	includes: L.Mixin.Events,

	statics: {
		MAX_RESOLUTION: 156543.03390625,
		MAX_EXTENT: [-20037508.34, -20037508.34, 20037508.34, 20037508.34],
		SRS: 'EPSG:3857',
		INCHES_PER_METER: 39.3701,
		DPI: 72,
		UNITS: 'm'
	},

	options: {
		autoLoad: false,
		autoOpen: true,
		outputFormat: 'pdf',
		outputFilename: 'leaflet-map',
		method: 'POST',
		rotation: 0,
		customParams: {}
	},

	initialize: function (options) {
		if (L.version <= '0.5.1') {
			throw 'Leaflet.print requires Leaflet 0.6.0+. Download latest from https://github.com/Leaflet/Leaflet/';
		}

		var context;

		options = L.setOptions(this, options);

		if (options.map) {
			this.setMap(options.map);
		}

		if (options.capabilities) {
			this._capabilities = options.capabilities;
		} else if (this.options.autoLoad) {
			this.loadCapabilities();
		}

		if (options.listeners) {
			if (options.listeners.context) {
				context = options.listeners.context;
				delete options.listeners.context;
			}
			this.addEventListener(options.listeners, context);
		}
	},

	loadCapabilities: function () {
		if (!this.options.url) {
			return;
		}

		var url;

		url = this.options.url + '/info.json';
		if (this.options.proxy) {
			url = this.options.proxy + url;
		}

		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: url,
			success: L.Util.bind(this.onCapabilitiesLoad, this)
		});
	},

	print: function (options) {
		options = L.extend(L.extend({}, this.options), options);

		if (!options.layout || !options.dpi) {
			throw 'Must provide a layout name and dpi value to print';
		}

		this.fire('beforeprint', {
			provider: this,
			map: this._map
		});

		var jsonData = JSON.stringify(L.extend({
			units: L.print.Provider.UNITS,
			srs: L.print.Provider.SRS,
			layout: options.layout,
			dpi: options.dpi,
			outputFormat: options.outputFormat,
			outputFilename: options.outputFilename,
			layers: this._encodeLayers(this._map._layers),
			pages: [{
				center: this._projectCoords(L.print.Provider.SRS, this._map.getCenter()),
				scale: this._getScale(),
				rotation: options.rotation
			}]
		}, this.options.customParams)),
		    url;

		if (options.method === 'GET') {
			url = this._capabilities.printURL + '?spec=' + encodeURIComponent(jsonData);

			if (options.proxy) {
				url = options.proxy + encodeURIComponent(url);
			}

			window.open(url);

			this.fire('print', {
				provider: this,
				map: this._map
			});
		} else {
			url = this._capabilities.createURL;

			if (options.proxy) {
				url = options.proxy + url;
			}

			if (this._xhr) {
				this._xhr.abort();
			}

			this._xhr = $.ajax({
				type: 'POST',
				dataType: 'json',
				url: url,
				data: jsonData,
				success: L.Util.bind(this.onPrintSuccess, this),
				error: L.Util.bind(this.onPrintError, this)
			});
		}

	},

	getCapabilities: function () {
		return this._capabilities;
	},

	setMap: function (map) {
		this._map = map;
	},

	setDpi: function (dpi) {
		var oldDpi = this.options.dpi;

		if (oldDpi !== dpi) {
			this.options.dpi = dpi;
			this.fire('dpichange', {
				provider: this,
				dpi: dpi
			});
		}
	},

	setLayout: function (name) {
		var oldName = this.options.layout;

		if (oldName !== name) {
			this.options.layout = name;
			this.fire('layoutchange', {
				provider: this,
				layout: name
			});
		}
	},

	setRotation: function (rotation) {
		var oldRotation = this.options.rotation;

		if (oldRotation !== this.options.rotation) {
			this.options.rotation = rotation;
			this.fire('rotationchange', {
				provider: this,
				rotation: rotation
			});
		}
	},

	_getScale: function () {
		var map = this._map,
		    bounds = map.getBounds(),
		    inchesKm = L.print.Provider.INCHES_PER_METER * 1000,
		    scales = this._capabilities.scales,
		    sw = bounds.getSouthWest(),
		    ne = bounds.getNorthEast(),
		    halfLat = (sw.lat + ne.lat) / 2,
		    midLeft = L.latLng(halfLat, sw.lng),
		    midRight = L.latLng(halfLat, ne.lng),
		    mwidth = midLeft.distanceTo(midRight),
		    pxwidth = map.getSize().x,
		    kmPx = mwidth / pxwidth / 1000,
		    mscale = (kmPx || 0.000001) * inchesKm * L.print.Provider.DPI,
		    closest = Number.POSITIVE_INFINITY,
		    i = scales.length,
		    diff,
		    scale;

		while (i--) {
			diff = Math.abs(mscale - scales[i].value);
			if (diff < closest) {
				closest = diff;
				scale = parseInt(scales[i].value, 10);
			}
		}
		return scale;
	},

	_getLayoutByName: function (name) {
		var layout, i, l;

		for (i = 0, l = this._capabilities.layouts.length; i < l; i++) {
			if (this._capabilities.layouts[i].name === name) {
				layout = this._capabilities.layouts[i];
				break;
			}
		}
		return layout;
	},

	_encodeLayers: function (layers) {
		var enc = [],
		    vectors = [],
		    layer,
		    id;

		for (id in layers) {
			if (layers.hasOwnProperty(id)) {
				layer = layers[id];

				if (layer instanceof L.TileLayer.WMS) {
					enc.push(this._encoders.layers.tilelayerwms.call(this, layer));
				} else if (layer instanceof L.TileLayer) {
					enc.push(this._encoders.layers.tilelayer.call(this, layer));
				} else if (layer instanceof L.ImageOverlay) {
					enc.push(this._encoders.layers.image.call(this, layer));
				} else if (layer instanceof L.Marker) {
					vectors.push(layer);
				} else if (layer instanceof L.Path && layer.toGeoJSON) {
					vectors.push(layer);
				} else {
					continue;
				}
			}
		}

		if (vectors.length) {
			// Markers should always be on top of overlay types			
			var markers = [],
			    l = vectors.length;

			while (l--) {
				if (vectors[l] instanceof L.Marker) {
					markers.push(vectors[l]);
					vectors.splice(l, 1);
				}
			}
			if (markers.length) {
				markers.reverse();
				vectors = vectors.concat(markers);
			}
			enc.push(this._encoders.layers.vector.call(this, vectors));
		}

		return enc;
	},

	_encoders: {
		layers: {
			httprequest: function (layer) {
				var baseUrl = layer._url;

				if (baseUrl.indexOf('{s}') !== -1) {
					baseUrl = baseUrl.replace('{s}', layer.options.subdomains[0]);
				}
				baseUrl = this._getAbsoluteUrl(baseUrl);

				return {
					baseURL: baseUrl,
					opacity: layer.options.opacity
				};
			},
			tilelayer: function (layer) {
				var enc = this._encoders.layers.httprequest.call(this, layer),
				    baseUrl = layer._url.substring(0, layer._url.indexOf('{z}')),
				    resolutions = [],
				    zoom;

				// If using multiple subdomains, replace the subdomain placeholder
				if (baseUrl.indexOf('{s}') !== -1) {
					baseUrl = baseUrl.replace('{s}', layer.options.subdomains[0]);
				}

				for (zoom = 0; zoom <= layer.options.maxZoom; ++zoom) {
					resolutions.push(L.print.Provider.MAX_RESOLUTION / Math.pow(2, zoom));
				}

				return L.extend(enc, {
					// XYZ layer type would be a better fit but is not supported in mapfish plugin for GeoServer
					// See https://github.com/mapfish/mapfish-print/pull/38
					type: 'OSM',
					baseURL: baseUrl,
					extension: 'png',
					tileSize: [layer.options.tileSize, layer.options.tileSize],
					maxExtent: L.print.Provider.MAX_EXTENT,
					resolutions: resolutions,
					singleTile: false
				});
			},
			tilelayerwms: function (layer) {
				var enc = this._encoders.layers.httprequest.call(this, layer),
				    layerOpts = layer.options,
				    p;

				L.extend(enc, {
					type: 'WMS',
					layers: [layerOpts.layers].join(',').split(','),
					format: layerOpts.format,
					styles: [layerOpts.styles].join(',').split(','),
					singleTile: true
				});

				for (p in layer.wmsParams) {
					if (layer.wmsParams.hasOwnProperty(p)) {
						if ('detectretina,format,height,layers,request,service,srs,styles,version,width'.indexOf(p.toLowerCase()) === -1) {
							if (!enc.customParams) {
								enc.customParams = {};
							}
							enc.customParams[p] = layer.wmsParams[p];
						}
					}
				}
				return enc;
			},
			image: function (layer) {
				return {
					type: 'Image',
					opacity: layer.options.opacity,
					name: 'image',
					baseURL: this._getAbsoluteUrl(layer._url),
					extent: this._projectBounds(L.print.Provider.SRS, layer._bounds)
				};
			},
			vector: function (features) {
				var encFeatures = [],
				    encStyles = {},
				    opacity,
				    feature,
				    style,
				    dictKey,
				    dictItem = {},
				    styleDict = {},
				    styleName,
				    nextId = 1,
				    featureGeoJson,
				    i, l;

				for (i = 0, l = features.length; i < l; i++) {
					feature = features[i];

					if (feature instanceof L.Marker) {
						var icon = feature.options.icon,
						    iconUrl = icon.options.iconUrl || L.Icon.Default.imagePath + '/marker-icon.png',
						    iconSize = L.Util.isArray(icon.options.iconSize) ? new L.Point(icon.options.iconSize[0], icon.options.iconSize[1]) : icon.options.iconSize,
						    iconAnchor = L.Util.isArray(icon.options.iconAnchor) ? new L.Point(icon.options.iconAnchor[0], icon.options.iconAnchor[1]) : icon.options.iconAnchor,
						    scaleFactor = (this.options.dpi / L.print.Provider.DPI);

						style = {
							externalGraphic: this._getAbsoluteUrl(iconUrl),
							graphicWidth: (iconSize.x / scaleFactor),
							graphicHeight: (iconSize.y / scaleFactor),
							graphicXOffset: (-iconAnchor.x / scaleFactor),
							graphicYOffset: (-iconAnchor.y / scaleFactor)
						};
					} else {
						style = this._extractFeatureStyle(feature);
					}

					dictKey = JSON.stringify(style);
					dictItem = styleDict[dictKey];
					if (dictItem) {
						styleName = dictItem;
					} else {
						styleDict[dictKey] = styleName = nextId++;
						encStyles[styleName] = style;
					}

					featureGeoJson = feature.toGeoJSON();
					featureGeoJson.geometry.coordinates = this._projectCoords(L.print.Provider.SRS, featureGeoJson.geometry.coordinates);
					featureGeoJson.properties._leaflet_style = styleName;

					// All markers will use the same opacity as the first marker found
					if (opacity === null) {
						opacity = feature.options.opacity || 1.0;
					}

					encFeatures.push(featureGeoJson);
				}

				return {
					type: 'Vector',
					styles: encStyles,
					opacity: opacity,
					styleProperty: '_leaflet_style',
					geoJson: {
						type: 'FeatureCollection',
						features: encFeatures
					}
				};
			}
		}
	},

	_extractFeatureStyle: function (feature) {
		var options = feature.options;

		return {
			stroke: options.stroke,
			strokeColor: options.color,
			strokeWidth: options.weight,
			strokeOpacity: options.opacity,
			strokeLinecap: 'round',
			fill: options.fill,
			fillColor: options.fillColor || options.color,
			fillOpacity: options.fillOpacity
		};
	},

	_getAbsoluteUrl: function (url) {
        var a;

        if (L.Browser.ie) {
            a = document.createElement('a');
            a.style.display = 'none';
            document.body.appendChild(a);
            a.href = url;
            document.body.removeChild(a);
        } else {
            a = document.createElement('a');
            a.href = url;
        }
        return a.href;
	},

	_projectBounds: function (crs, bounds) {
		var sw = bounds.getSouthWest(),
		    ne = bounds.getNorthEast();

		return this._projectCoords(crs, sw).concat(this._projectCoords(crs, ne));
	},

	_projectCoords: function (crs, coords) {
		var crsKey = crs.toUpperCase().replace(':', ''),
		    crsClass = L.CRS[crsKey];

		if (!crsClass) {
			throw 'Unsupported coordinate reference system: ' + crs;
		}

		return this._project(crsClass, coords);
	},

	_project: function (crsClass, coords) {
		var projected,
		    pt,
		    i, l;

		if (typeof coords[0] === 'number') {
			coords = new L.LatLng(coords[1], coords[0]);
		}

		if (coords instanceof L.LatLng) {
			pt = crsClass.project(coords);
			return [pt.x, pt.y];
		} else {
			projected = [];
			for (i = 0, l = coords.length; i < l; i++) {
				projected.push(this._project(crsClass, coords[i]));
			}
			return projected;
		}
	},

	// --------------------------------------------------
	// Event handlers
	// --------------------------------------------------

	onCapabilitiesLoad: function (response) {
		this._capabilities = response;

		if (!this.options.layout) {
			this.options.layout = this._capabilities.layouts[0].name;
		}

		if (!this.options.dpi) {
			this.options.dpi = this._capabilities.dpis[0].value;
		}

		this.fire('capabilitiesload', {
			provider: this,
			capabilities: this._capabilities
		});
	},

	onPrintSuccess: function (response) {
		var url = response.getURL + (L.Browser.ie ? '?inline=true' : '');

		if (this.options.autoOpen) {
			if (L.Browser.ie) {
				window.open(url);
			} else {
				window.location.href = url;
			}
		}

		this._xhr = null;

		this.fire('print', {
			provider: this,
			response: response
		});
	},

	onPrintError: function (jqXHR) {
		this._xhr = null;

		this.fire('printexception', {
			provider: this,
			response: jqXHR
		});
	}
});

L.print.provider = function (options) {
	return new L.print.Provider(options);
};


/*global L:false*/

L.Control.Print = L.Control.extend({

	options: {
		position: 'topleft',
		showLayouts: true
	},

	initialize: function (options) {
		L.Control.prototype.initialize.call(this, options);

		this._actionButtons = {};
		this._actionsVisible = false;

		if (this.options.provider && this.options.provider instanceof L.print.Provider) {
			this._provider = this.options.provider;
		} else {
			this._provider = L.print.Provider(this.options.provider || {});
		}
	},

	onAdd: function (map) {
		var capabilities,
		    container = L.DomUtil.create('div', 'leaflet-control-print'),
		    toolbarContainer = L.DomUtil.create('div', 'leaflet-bar', container),
		    link;

		this._toolbarContainer = toolbarContainer;

		link = L.DomUtil.create('a', 'leaflet-print-print', toolbarContainer);
		link.href = '#';
		link.title = 'Print map';

		L.DomEvent
			.on(link, 'click', L.DomEvent.stopPropagation)
			.on(link, 'mousedown', L.DomEvent.stopPropagation)
			.on(link, 'dblclick', L.DomEvent.stopPropagation)
			.on(link, 'click', L.DomEvent.preventDefault)
			.on(link, 'click', this.onPrint, this);

		if (this.options.showLayouts) {
			capabilities = this._provider.getCapabilities();
			if (!capabilities) {
				this._provider.once('capabilitiesload', this.onCapabilitiesLoad, this);
			} else {
				this._createActions(container, capabilities);
			}
		}

		this._provider.setMap(map);

		return container;
	},

	onRemove: function () {
		var buttonId,
		    button;

		for (buttonId in this._actionButtons) {
			if (this._actionButtons.hasOwnProperty(buttonId)) {
				button = this._actionButtons[buttonId];
				this._disposeButton(button.button, button.callback, button.scope);
			}
		}

		this._actionButtons = {};
		this._actionsContainer = null;
	},

	getProvider: function () {
		return this._provider;
	},

	_createActions: function (container, capabilities) {
		var layouts = capabilities.layouts,
		    l = layouts.length,
		    actionsContainer = L.DomUtil.create('ul', 'leaflet-print-actions', container),
		    buttonWidth = 100,
		    containerWidth = (l * buttonWidth) + (l - 1),
		    button,
		    li,
		    i;

		actionsContainer.style.width = containerWidth + 'px';

		for (i = 0; i < l; i++) {
			li = L.DomUtil.create('li', '', actionsContainer);

			button = this._createButton({
				title: 'Print map using the ' + layouts[i].name + ' layout',
				text: this._ellipsis(layouts[i].name, 16),
				container: li,
				callback: this.onActionClick,
				context: this
			});

			this._actionButtons[L.stamp(button)] = {
				name: layouts[i].name,
				button: button,
				callback: this.onActionClick,
				context: this
			};
		}

		this._actionsContainer = actionsContainer;
	},

	_createButton: function (options) {
		var link = L.DomUtil.create('a', options.className || '', options.container);
		link.href = '#';

		if (options.text) {
			link.innerHTML = options.text;
		}

		if (options.title) {
			link.title = options.title;
		}

		L.DomEvent
			.on(link, 'click', L.DomEvent.stopPropagation)
			.on(link, 'mousedown', L.DomEvent.stopPropagation)
			.on(link, 'dblclick', L.DomEvent.stopPropagation)
			.on(link, 'click', L.DomEvent.preventDefault)
			.on(link, 'click', options.callback, options.context);

		return link;
	},

	_showActionsToolbar: function () {
		L.DomUtil.addClass(this._toolbarContainer, 'leaflet-print-actions-visible');
		this._actionsContainer.style.display = 'block';

		this._actionsVisible = true;
	},

	_hideActionsToolbar: function () {
		this._actionsContainer.style.display = 'none';
		L.DomUtil.removeClass(this._toolbarContainer, 'leaflet-print-actions-visible');

		this._actionsVisible = false;
	},

	_ellipsis: function (value, len) {
		if (value && value.length > len) {
			value = value.substr(0, len - 3) + '...';
		}
		return value;
	},

	// --------------------------------------------------
	// Event Handlers
	// --------------------------------------------------

	onCapabilitiesLoad: function (event) {
		this._createActions(this._container, event.capabilities);
	},

	onActionClick: function (event) {
		var id = '' + L.stamp(event.target),
		    button,
		    buttonId;

		for (buttonId in this._actionButtons) {
			if (this._actionButtons.hasOwnProperty(buttonId) && buttonId === id) {
				button = this._actionButtons[buttonId];
				this._provider.print({
					layout: button.name
				});
				break;
			}
		}
		this._hideActionsToolbar();
	},

	onPrint: function () {
		if (this.options.showLayouts) {
			if (!this._actionsVisible) {
				this._showActionsToolbar();
			} else {
				this._hideActionsToolbar();
			}
		} else {
			this._provider.print();
		}
	}
});

L.control.print = function (options) {
	return new L.Control.Print(options);
};


}(this, document));
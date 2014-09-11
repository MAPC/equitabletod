@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
	Search.Controller =

	  	showSimpleSearchForm: ->
            # getting all data for calculating stats
	  		searchargs = App.request 'searcharg:entities'
	  		allfeaturesResponse = $.ajax
                    url: "/search.json?by_name="
                    done: (result) =>
                        return result
            allfeature = allfeaturesResponse.complete()
            # parsing the response fields
            allfeature.done =>
                # tst_info_slider(allfeature)
                allfeatures = allfeature.responseJSON
                features = _.values allfeatures.features 
              
                #
                fars = _.map features, (key, value) -> key.properties.ov_far 
                hhincs = _.map features, (key, value) -> key.properties.ov_hhinc
                vmts = _.map features, (key, value) -> key.properties.ov_vmthday
                pcttrans = _.map features, (key, value) -> key.properties.ov_pcttran
                prkacs = _.map features, (key, value) -> key.properties.ov_prkac
                emp10s = _.map features, (key, value) -> key.properties.ov_emp10
                extaxrevs = _.map features, (key, value) -> key.properties.ex_taxrev
                hh10s = _.map features, (key, value) -> key.properties.ov_hh10
                vehphhs = _.map features, (key, value) -> key.properties.ov_vehphh
                trnpcmis = _.map features, (key, value) -> key.properties.ov_trnpcmi if key.properties.ov_trnpcmi
                ghgs = _.map features, (key, value) -> key.properties.ov_ghg if key.properties.ov_ghg
                intntots = _.map features, (key, value) -> key.properties.ov_intntot if key.properties.ov_intntot
                mixs = _.map features, (key, value) -> key.properties.ov_mix if key.properties.ov_mix
                hupacs = _.map features, (key, value) -> key.properties.ov_hupac if key.properties.ov_hupac
                empdens = _.map features, (key, value) -> key.properties.ov_empden if key.properties.ov_empden
                est10s = _.map features, (key, value) -> key.properties.ov_est_10 if key.properties.ov_est_10
                avals = _.map features, (key, value) -> key.properties.ov_aval if key.properties.ov_aval
                rentoccs = _.map features, (key, value) -> key.properties.ov_rentocc if key.properties.ov_rentocc
                hhnocars = _.map features, (key, value) -> key.properties.ov_hhnocar if key.properties.ov_hhnocar
                edatts = _.map features, (key, value) -> key.properties.ov_ed_att if key.properties.ov_ed_att
                walkscores = _.map features, (key, value) -> key.properties.walkscore if key.properties.walkscore
                hupipes = _.map features, (key, value) -> key.properties.ov_hupipe if key.properties.ov_hupipe
                emppipes = _.map features, (key, value) -> key.properties.ov_emppipe if key.properties.ov_emppipe
                gon.vehphhs = vehphhs
                gon.vmts = vmts
                gon.fars = fars
                gon.pcttrans = pcttrans
                gon.prkacs = prkacs
                gon.emp10s = emp10s
                gon.extaxrevs = extaxrevs
                gon.hh10s = hh10s
                gon.hhincs = hhincs
                gon.trnpcmis = trnpcmis
                gon.ghgs = ghgs
                gon.intntots = intntots
                gon.mixs = mixs
                gon.hupacs = hupacs
                gon.empdens = empdens
                gon.est10s = est10s
                gon.avals = avals
                gon.rentoccs = rentoccs
                gon.hhnocars = hhnocars
                gon.edatts = edatts
                gon.walkscores = walkscores
                gon.hupipes = hupipes
                gon.emppipes = emppipes
                # find minimum and maximum values #
                maxhhinc = hhincs.reduce (a,b) -> Math.max a, b
                minhhinc = hhincs.reduce (a,b) -> Math.min a, b
                maxvmt = vmts.reduce (a,b) -> Math.max a, b
                minvmt = vmts.reduce (a,b) -> Math.min a, b
                maxpcttran = pcttrans.reduce (a,b) -> Math.max a, b
                minpcttran = pcttrans.reduce (a,b) -> Math.min a, b
                maxvehphh = vehphhs.reduce (a,b) -> Math.max a, b
                minvehphh = vehphhs.reduce (a,b) -> Math.min a, b
                maxtrnpcmi = trnpcmis.reduce (a,b) -> Math.max a, b
                mintrnpcmi = trnpcmis.reduce (a,b) -> Math.min a, b
                maxghg = ghgs.reduce (a,b) -> Math.max a, b
                minghg = ghgs.reduce (a,b) -> Math.min a, b
                maxfar = fars.reduce (a,b) -> Math.max a, b
                minfar = fars.reduce (a,b) -> Math.min a, b
                maxprkac = prkacs.reduce (a,b) -> Math.max a, b
                minprkac = prkacs.reduce (a,b) -> Math.min a, b
                maxintntot = intntots.reduce (a,b) -> Math.max a, b
                minintntot = intntots.reduce (a,b) -> Math.min a, b
                maxmix = mixs.reduce (a,b) -> Math.max a, b
                minmix = mixs.reduce (a,b) -> Math.min a, b
                maxhupac = hupacs.reduce (a,b) -> Math.max a, b
                minhupac = hupacs.reduce (a,b) -> Math.min a, b
                maxempden = empdens.reduce (a,b) -> Math.max a, b
                minempden = empdens.reduce (a,b) -> Math.min a, b
                maxwalkscore = walkscores.reduce (a,b) -> Math.max a, b
                minwalkscore = walkscores.reduce (a,b) -> Math.min a, b
                maxhupipe = hupipes.reduce (a,b) -> Math.max a, b
                minhupipe = hupipes.reduce (a,b) -> Math.min a, b
                maxemppipe = emppipes.reduce (a,b) -> Math.max a, b
                minemppipe = emppipes.reduce (a,b) -> Math.min a, b
                maxemp10 = emp10s.reduce (a,b) -> Math.max a, b
                minemp10 = emp10s.reduce (a,b) -> Math.min a, b
                maxextaxrev = extaxrevs.reduce (a,b) -> Math.max a, b
                minextaxrev = extaxrevs.reduce (a,b) -> Math.min a, b
                maxest10 = est10s.reduce (a,b) -> Math.max a, b
                minest10 = est10s.reduce (a,b) -> Math.min a, b
                maxaval = avals.reduce (a,b) -> Math.max a, b
                minaval = avals.reduce (a,b) -> Math.min a, b
                maxhh10 = hh10s.reduce (a,b) -> Math.max a, b
                minhh10 = hh10s.reduce (a,b) -> Math.min a, b
                maxrentocc = rentoccs.reduce (a,b) -> Math.max a, b
                minrentocc = rentoccs.reduce (a,b) -> Math.min a, b
                maxhhnocar = hhnocars.reduce (a,b) -> Math.max a, b
                minhhnocar = hhnocars.reduce (a,b) -> Math.min a, b
                maxedatt = edatts.reduce (a,b) -> Math.max a, b
                minedatt = edatts.reduce (a,b) -> Math.min a, b
                # assign max min values to gon object
                gon.minhhinc = minhhinc
                gon.maxhhinc = maxhhinc
                gon.minvmt = minvmt
                gon.maxvmt = maxvmt
                gon.minpcttran = minpcttran
                gon.maxpcttran = maxpcttran
                gon.minvehphh = minvehphh
                gon.maxvehphh = maxvehphh
                gon.mintrnpcmi = mintrnpcmi
                gon.maxtrnpcmi = maxtrnpcmi
                gon.minghg = minghg
                gon.maxghg = maxghg
                gon.minfar = minfar
                gon.maxfar = maxfar
                gon.minprkac = minprkac
                gon.maxprkac = maxprkac
                gon.minintntot = minintntot
                gon.maxintntot = maxintntot
                gon.minmix = minmix
                gon.maxmix = maxmix
                gon.minhupac = minhupac
                gon.maxhupac = maxhupac
                gon.minempden = minempden
                gon.maxempden = maxempden
                gon.minwalkscore = minwalkscore
                gon.maxwalkscore = maxwalkscore
                gon.minhupipe = minhupipe
                gon.maxhupipe = maxhupipe
                gon.minemppipe = minemppipe
                gon.maxemppipe = maxemppipe
                gon.minemp10 = minemp10
                gon.maxemp10 = maxemp10
                gon.minextaxrev = minextaxrev
                gon.maxextaxrev = maxextaxrev
                gon.minest10 = minest10
                gon.maxest10 = maxest10
                gon.minaval = minaval
                gon.maxaval = maxaval
                gon.minhh10 = minhh10
                gon.maxhh10 = maxhh10
                gon.minrentocc = minrentocc
                gon.maxrentocc = maxrentocc
                gon.minhhnocar = minhhnocar
                gon.maxhhnocar = maxhhnocar
                gon.minedatt = minedatt
                gon.maxedatt = maxedatt
	  		simpleSearchForm = @getSimpleSearchView searchargs
	  		App.mainRegion.show simpleSearchForm


	  	getSimpleSearchView: (searchargs) ->
	  		new Search.SimpleSearchFormLayout
	  			collection: searchargs

	  	


RadarChart = draw: (id, d, options) ->
  cfg =
    radius: 5
    w: 200
    h: 200
    factor: 1
    factorLegend: .85
    levels: 3
    maxValue: 0
    radians: 2 * Math.PI
    opacityArea: 0.5
    ToRight: 5
    TranslateX: 80
    TranslateY: 30
    ExtraWidthX: 100
    ExtraWidthY: 20
    color: d3.scale.category10()

  if "undefined" isnt typeof options
    for i of options
      cfg[i] = options[i]  if "undefined" isnt typeof options[i]
  cfg.maxValue = Math.max(cfg.maxValue, d3.max(d, (i) ->
    d3.max i.map((o) ->
      o.value
    )
  ))
  allAxis = (d[0].map((i, j) ->
    i.axis
  ))
  total = allAxis.length
  radius = cfg.factor * Math.min(cfg.w, cfg.h / 2)
  Format = d3.format("g")
  d3.select(id).select("svg").remove()
  g = d3.select(id).append("svg").attr("width", cfg.w + cfg.ExtraWidthX).attr("height", cfg.h + cfg.ExtraWidthY).append("g").attr("transform", "translate(" + cfg.TranslateX + "," + cfg.TranslateY + ")")
  tooltip = undefined
  
  #Circular segments
  j = 0

  while j < cfg.levels
    levelFactor = cfg.factor * radius * ((j + 1) / cfg.levels)
    g.selectAll(".levels").data(allAxis).enter().append("svg:line").attr("x1", (d, i) ->
      levelFactor * (1 - cfg.factor * Math.sin(i * cfg.radians / total))
    ).attr("y1", (d, i) ->
      levelFactor * (1 - cfg.factor * Math.cos(i * cfg.radians / total))
    ).attr("x2", (d, i) ->
      levelFactor * (1 - cfg.factor * Math.sin((i + 1) * cfg.radians / total))
    ).attr("y2", (d, i) ->
      levelFactor * (1 - cfg.factor * Math.cos((i + 1) * cfg.radians / total))
    ).attr("class", "line").style("stroke", "grey").style("stroke-opacity", "1").style("stroke-width", "0.4px").attr "transform", "translate(" + (cfg.w / 2 - levelFactor) + ", " + (cfg.h / 2 - levelFactor) + ")"
    j++
  
  #Text indicating at what % each level is
  j = 0

  while j < cfg.levels
    levelFactor = cfg.factor * radius * ((j + 1) / cfg.levels)
    #dummy data
    g.selectAll(".levels").data([1]).enter().append("svg:text").attr("x", (d) ->
      levelFactor * (1 - cfg.factor * Math.sin(0))
    ).attr("y", (d) ->
      levelFactor * (1 - cfg.factor * Math.cos(0))
    ).attr("class", "legend").style("font-family", "sans-serif").style("font-size", "10px").attr("transform", "translate(" + (cfg.w / 2 - levelFactor + cfg.ToRight) + ", " + (cfg.h / 2 - levelFactor) + ")").attr("fill", "#737373").text Format((j + 1) * cfg.maxValue / cfg.levels)
    j++
  j = 0

  while j < cfg.levels - 1
    levelFactor = cfg.factor * radius * ((j + 1) / cfg.levels)
    #dummy data
    g.selectAll(".levels").data([1]).enter().append("svg:text").attr("x", (d) ->
      levelFactor * (1 - cfg.factor * Math.sin(90))
    ).attr("y", (d) ->
      levelFactor * (1 - cfg.factor * Math.cos(90))
    ).attr("class", "legend").style("font-family", "sans-serif").style("font-size", "10px").attr("transform", "translate(" + (cfg.w / 2 - levelFactor - 6) + ", " + (cfg.h / 2 - levelFactor + 2) + ")").attr("fill", "#737373").text Format((j + 1) * cfg.maxValue / cfg.levels)
    j++
  j = 0

  while j < cfg.levels - 1
    levelFactor = cfg.factor * radius * ((j + 1) / cfg.levels)
    #dummy data
    g.selectAll(".levels").data([1]).enter().append("svg:text").attr("x", (d) ->
      levelFactor * (1 - cfg.factor * Math.sin(180))
    ).attr("y", (d) ->
      levelFactor * (1 - cfg.factor * Math.cos(180))
    ).attr("class", "legend").style("font-family", "sans-serif").style("font-size", "10px").attr("transform", "translate(" + (cfg.w / 2 - levelFactor + cfg.ToRight - 1) + ", " + (cfg.h / 2 - levelFactor - 7) + ")").attr("fill", "#737373").text Format((j + 1) * cfg.maxValue / cfg.levels)
    j++
  series = 0
  axis = g.selectAll(".axis").data(allAxis).enter().append("g").attr("class", "axis")
  axis.append("line").attr("x1", cfg.w / 2).attr("y1", cfg.h / 2).attr("x2", (d, i) ->
    cfg.w / 2 * (1 - cfg.factor * Math.sin(i * cfg.radians / total))
  ).attr("y2", (d, i) ->
    cfg.h / 2 * (1 - cfg.factor * Math.cos(i * cfg.radians / total))
  ).attr("class", "line").style("stroke", "grey").style "stroke-width", "1px"
  axis.append("text").attr("class", "legend").text((d) ->
    d
  ).style("font-family", "Lato", "Helvetica Neue").style("font-size", "9px").attr("text-anchor", "middle").attr("dy", "1.5em").attr("transform", (d, i) ->
    "translate(0, -10)"
  ).attr("x", (d, i) ->
    cfg.w / 2 * (1 - cfg.factorLegend * Math.sin(i * cfg.radians / total)) - 60 * Math.sin(i * cfg.radians / total)
  ).attr "y", (d, i) ->
    cfg.h / 2 * (1 - Math.cos(i * cfg.radians / total)) - 20 * Math.cos(i * cfg.radians / total)

  d.forEach (y, x) ->
    dataValues = []
    g.selectAll(".nodes").data y, (j, i) ->
      dataValues.push [
        cfg.w / 2 * (1 - (parseFloat(Math.max(j.value, 0)) / cfg.maxValue) * cfg.factor * Math.sin(i * cfg.radians / total))
        cfg.h / 2 * (1 - (parseFloat(Math.max(j.value, 0)) / cfg.maxValue) * cfg.factor * Math.cos(i * cfg.radians / total))
      ]
      return

    dataValues.push dataValues[0]
    g.selectAll(".area").data([dataValues]).enter().append("polygon").attr("class", "radar-chart-serie" + series).style("stroke-width", ".5px").style("stroke", "red").attr("points", (d) ->
      str = ""
      pti = 0

      while pti < d.length
        str = str + d[pti][0] + "," + d[pti][1] + " "
        pti++
      str
    ).style("fill", (j, i) ->
      "red"
    ).style("fill-opacity", cfg.opacityArea).on("mouseover", (d) ->
      z = "polygon." + d3.select(this).attr("class")
      tooltip.attr("x", x - 10).attr("y", y["0"]).text("").transition(200).style "opacity", 1
      g.selectAll("polygon").transition(200).style "fill-opacity", 0.1
      g.selectAll(z).transition(200).style "fill-opacity", .7
      return
    ).on "mouseout", ->
      tooltip.transition(200).style "opacity", 0
      g.selectAll("polygon").transition(200).style "fill-opacity", cfg.opacityArea
      return

    series++
    return

  series = 0
  d.forEach (y, x) ->
    g.selectAll(".nodes").data(y).enter().append("svg:circle").attr("class", "radar-chart-serie" + series).attr("r", cfg.radius + 6).attr("alt", (j) ->
      Math.max j.value, 0
    ).attr("cx", (j, i) ->
      dataValues.push [
        cfg.w / 2 * (1 - (parseFloat(Math.max(j.value, 0)) / cfg.maxValue) * cfg.factor * Math.sin(i * cfg.radians / total))
        cfg.h / 2 * (1 - (parseFloat(Math.max(j.value, 0)) / cfg.maxValue) * cfg.factor * Math.cos(i * cfg.radians / total))
      ]
      cfg.w / 2 * (1 - (Math.max(j.value, 0) / cfg.maxValue) * cfg.factor * Math.sin(i * cfg.radians / total))
    ).attr("cy", (j, i) ->
      cfg.h / 2 * (1 - (Math.max(j.value, 0) / cfg.maxValue) * cfg.factor * Math.cos(i * cfg.radians / total))
    ).attr("data-id", (j) ->
      j.axis
    ).style("fill", "red").style("fill-opacity", 0.01).on("mouseover", (d) ->
      newX = parseFloat(d3.select(this).attr("cx")) - 10
      newY = parseFloat(d3.select(this).attr("cy")) - 5
      tooltip.attr("x", newX).attr("y", newY).text(Format(d.value)).transition(200).style "opacity", 1
      z = "polygon." + d3.select(this).attr("class")
      g.selectAll("polygon").transition(200).style "fill-opacity", 0.1
      g.selectAll(z).transition(200).style "fill-opacity", .7
      return
    ).on("mouseout", ->
      tooltip.transition(200).style "opacity", 0
      g.selectAll("polygon").transition(200).style "fill-opacity", cfg.opacityArea
      return
    ).append("svg:title").text (j) ->
      Math.max j.value, 0

    series++
    return

  
  #Tooltip
  tooltip = g.append("text").style("opacity", 0).style("font-family", "sans-serif").style("font-size", "13px")
  return
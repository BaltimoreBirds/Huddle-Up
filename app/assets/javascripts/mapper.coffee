class @ExampleApp.Mapper

  constructor: (cssSelector) ->
    @cssSelector = cssSelector
    @map = null
    @bounds = new ExampleApp.MapBounds

  addCoordinates: (latitude, longitude) ->
    if latitude and longitude
      @bounds.add(latitude, longitude)

  render: =>
    @map = new ExampleApp.Map(@cssSelector, @bounds)
    @map.build()

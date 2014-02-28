  class window.Section extends Backbone.Model
    urlRoot: '/section'
    idAttribute: '_id' #conforming to mongodb id syntax
    initialize: ->
      console.log 'Initializing a Section'

    defaults:
      title: 'Class'
      link: '#'
      grade: 'A'
      credits:'0'
      category: 'default'
      htmlId: '#'


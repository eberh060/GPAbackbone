class window.buttonView extends Backbone.View
  tagName: 'div'
  buttonTemplate: _.template $('#buttons').html()

  events:
    'click button.test': 'test'

  # the @ essentialy means "this."
  initialize: ->
    @render()
    return

  render: ->
    @$el.html @template() #this.el is what we defined in tagName. use $el to get access to jQuery html() function
    this

  test: (event) ->
    # when the value of the text area changes, update the model on the client
    console.log(event)


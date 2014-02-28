class window.newSectionView extends Backbone.View
  tagName: 'div'
  template: _.template $('#section-create-template').html()
  data: {}
  events:
    'change': 'change'
    'click button.save': 'saveSection'
    'click button.create': 'openCreate'

  initialize: ->
    @render()
    this

  render: ->
    #@model.set {title: '', body: ''}
    @$el.html @template()

  change: (event) ->
    console.log 'changed'
    changeTarget = event.target
    @data[changeTarget.name] = changeTarget.value #uses name attribute from html

  openCreate: ->
    form = $('#create-form')
    form.show()
    $('#add-save-button').removeClass('btn-primary create')
    $('#add-save-button').addClass('btn-success save')
    $('#add-save-button').html('Save new Section')

  closeCreate: ->
    form = $('#create-form')
    form.hide()
    $('#add-save-button').removeClass('btn-success saveNew')
    $('#add-save-button').addClass('btn-primary create')
    $('#add-save-button').html('Create new Section')

  saveSection: ->
    #save all changes made to the model back to the database
    console.log 'saving...'
    newSec = new Section(@data)
    self = this
    newSec.save {},
      success: ->
        console.log 'saved'
        self.data = {}
      error: ->
        console.log 'error'
    @render()
    self.trigger 'save'
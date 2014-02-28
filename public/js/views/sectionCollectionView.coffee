###
Created by mart2967 on 1/30/14.
###
class window.SectionCollectionView extends Backbone.View
  events:
    'change': 'change'
    'click button.add': 'addClass'

  initialize: ->
    @$el. append '<button class="add">Add Class</button>'
    @render()

  render: ->
    _.each @collection.models, ((item) ->
      view = new SectionView(model: item)
      @$el.append view.el
      return
    ), this
    this
    # returning itself for chaining calls. syntax bears futher investigation

  change: ->
    gradeTotal = 0
    creditsTotal = 0
    _.each @collection.models, ((item) ->
        gradeTotal += convertGrade(item.get('grade')) * parseFloat(item.get('credits'))
        creditsTotal += parseFloat(item.get('credits'))
    )
    $("#GPADisplay").html("Your GPA: " + (gradeTotal/creditsTotal))

  addClass: ->
    newSection = new Section {
      grade: 'A'
      credits: '0'
    }
    newSection.save()
    @$el.append new SectionView(model: newSection).el
    sectionList = new window.SectionCollection()
    sectionList.fetch success: ->
      $('#content').html new window.SectionCollectionView(collection: sectionList).$el
      $('#bs-example-navbar-collapse-1').html new window.NavbarView(collection: sectionList).$el
      return

  convertGrade = (grade) ->
    switch grade.toUpperCase()
      when "A" then 4.0
      when "A-" then 3.7
      when "B+" then 3.33
      when "B" then 3.0
      when "B-" then 2.7
      when "C+" then 2.3
      when "C" then 2.0
      when "C-" then 1.7
      when "D+" then 1.3
      when "D" then 1.0
      when "D-" then 0.7
      when "F" then 0.0
      else 0.0

###
Created by mart2967 on 1/30/14.
###

class window.AppRouter extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    sectionList = new SectionCollection()
    blankSection = new newSectionView()
    listView = new SectionCollectionView(collection: sectionList)
    sectionList.fetch success: ->
      listView.render()

    $('#bs-example-navbar-collapse-1').html new NavbarView(collection: sectionList).$el
    $('#add-section-div').html blankSection.$el
    $('#content').html listView.$el
    @listenTo blankSection, 'save', ->
      console.log 'detected save'
      sectionList.fetch success: ->
        listView.render()

# Starts the app as soon as the DOM is ready
$(document).ready ->
  app = new AppRouter()
  Backbone.history.start pushState: true

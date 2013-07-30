define [
  'onion/controller'
  'prog_app/room_panel_view'
], (
  Controller
  RoomPanelView
) ->

  class RoomPanelController extends Controller

    @view RoomPanelView

    @models 'room', 'tabs', 'roomInCollection'

    @onModel 'tabs', 'change:currentTab', 'updateView'

    @onModel 'roomInCollection', 'remove', ->
      @destroy()

    @onView 'delete', ->
      @roomInCollection.remove()

    @after 'init', (models, opts) ->
      console.log("RoomPanelController #{@room.id()} init")

    run: ->
      if ! @view.isRendered()
        @view.render({@room})
      @updateView()

    updateView: ->
      if @tabs.currentTab() == @room.id()
        @view.show()
      else
        @view.hide()

define [
  'onion/controller'
  'prog_app/room_tab_view'
], (
  Controller
  RoomTabView
) ->

  class RoomTabController extends Controller

    @view RoomTabView

    @models 'room', 'tabs', 'roomInCollection'

    @onModel 'roomInCollection', 'remove', ->
      @destroy()

    @onView 'select', ->
      @tabs.select(@room.id())

    @after 'init', (models, opts) ->
      console.log("RoomTabController #{@room.id()} init")
      if !opts.anchor
        @view.render({@room})

    @after 'ready', ->
      console.log("RoomTabController #{@room.id()} ready")

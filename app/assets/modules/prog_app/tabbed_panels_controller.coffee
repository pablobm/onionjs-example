define [
  'onion/controller'
  'prog_app/tabbed_panels_view'
  'prog_app/room_tab_controller'
  'prog_app/room_panel_controller'
  'prog_app/room'
], (
  Controller
  TabbedPanelsView
  RoomTabController
  RoomPanelController
  Room
) ->

  class TabbedPanelsController extends Controller

    @view TabbedPanelsView

    @models 'rooms', 'tabs'

    @onView 'edit', ->
      @view.doEdit()

    @onView 'add', ->
      newId = @rooms.last().id()+1
      @rooms.add(new Room(id: newId))
      @tabs.add(newId)

    @onModel 'rooms', 'add', (room) ->
      roomInCollection = @rooms.membershipFor(room)
      @spawnWithModel RoomPanelController, 'room', room, models: {roomInCollection}
      @spawnWithModel RoomTabController, 'room', room, models: {roomInCollection}

    @after 'init', ->
      console.log('TabbedPanelsController init')

    run: ->
      @rooms.forEach (room) =>
        roomInCollection = @rooms.membershipFor(room)
        @spawnWithModel RoomPanelController, 'room', room, models: {roomInCollection}
        @spawnWithModel RoomTabController, 'room', room, models: {roomInCollection}

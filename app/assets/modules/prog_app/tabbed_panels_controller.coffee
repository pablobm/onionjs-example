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
      newId = @rooms.length+1
      @rooms.add(new Room(id: newId))
      console.log('adding', newId)
      @tabs.add(newId)

    @onModel 'rooms', 'add', (room) ->
      @setChild ['roomTabs', room.id()], RoomTabController, {room, roomInCollection: @rooms.membershipFor(room)}
      @setChild ['roomPanels', room.id()], RoomPanelController, {room, roomInCollection: @rooms.membershipFor(room)}

    @after 'init', ->
      console.log('TabbedPanelsController init')

    @after 'ready', ->
      console.log('TabbedPanelsController ready')

      @rooms.forEach (room) =>
        roomInCollection = @rooms.membershipFor(room)
        @setChild ['roomTabs', room.id()], RoomTabController, {room, roomInCollection}, {anchor: true}
        @setChild ['roomPanels', room.id()], RoomPanelController, {room, roomInCollection}, {anchor: true}
define [
  'onion/controller'
  'onion/collection'
  'prog_app/prog_app_view'
  'prog_app/tabbed_panels_controller'
  'prog_app/room'
  'models/tabset'
], (
  Controller
  Collection
  ProgAppView
  TabbedPanelsController
  Room
  Tabset
) ->

  room = (id) ->
    { id: -> id }


  class ProgAppController extends Controller

    @view ProgAppView

    @after 'init', ->
      console.log('init')

      tabs = new Tabset(tabs: [1, 2, 3])
      tabs.select(1)

      @newModel 'rooms', new Collection([new Room(id: 1), new Room(id: 2), new Room(id: 3)])
      @newModel 'tabs', tabs

    @after 'ready', ->
      console.log('ready')
      @setChild 'tabbedPanels', TabbedPanelsController, {}, {anchor: true}

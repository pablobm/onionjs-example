define [
  'lib/mustache_view'
], (
  MustacheView
) ->

  class TabbedPanelsView extends MustacheView

    @onDom '.action-edit', 'click', 'edit'
    @onDom '.action-add', 'click', 'add'

    @attachChild 'RoomPanelView', ({model, modelName}) -> ['panel', model.id()].join(':')
    @attachChild 'RoomTabView', ({model, modelName}) -> ['tab', model.id()].join(':')

    doEdit: ->
      @find('.action-edit').after(' - Edited')

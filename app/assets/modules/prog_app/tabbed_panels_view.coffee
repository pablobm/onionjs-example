define [
  'onion/mustache_view'
], (
  MustacheView
) ->

  class TabbedPanelsView extends MustacheView

    @onDom '.action-edit', 'click', 'edit'
    @onDom '.action-add', 'click', 'add'

    doEdit: ->
      @find('.action-edit').after(' - Edited')
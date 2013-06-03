define [
  'onion/mustache_view'
  'onion/vendor/text!prog_app/room_panel.mustache'
], (
  MustacheView
  template
) ->

  class RoomPanelView extends MustacheView

    @template template

    @onDom '.action-delete', 'click', 'delete'

    hide: ->
      @$dom().hide()

    show: ->
      @$dom().show()
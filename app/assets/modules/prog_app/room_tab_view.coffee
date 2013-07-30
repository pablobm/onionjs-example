define [
  'lib/mustache_view'
  'onion/vendor/text!prog_app/room_tab.mustache'
], (
  MustacheView
  template
) ->

  class RoomTabView extends MustacheView

    @template template

    @onDom 'a', 'click', 'select'

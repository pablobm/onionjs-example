define [
  'onion/view'
  'onion/mustache_view'
], (
  View
  mustacheView
) ->

  class MustacheView extends View

    @use mustacheView

    templateBody: null
    @template = (tpl) ->
      @templateBody = tpl

    render: ->
      @renderMustache(@.constructor.templateBody, @models)


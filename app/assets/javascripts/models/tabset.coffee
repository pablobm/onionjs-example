define ['onion/struct'], (Struct) ->

  class Tabset extends Struct

    @attributes 'currentTab', 'tabs'

    @after 'init', ->
      if @tabs()
        @setCurrentTab @tabs()[0]
      else
        @setTabs([])

    select: (tab) ->
      if @tabs().indexOf(tab) != -1
        @setCurrentTab(tab)
        @emit("select:#{tab}")
      else
        throw new Error("There's no tab called '#{tab}'")

    add: (tab) ->
      @tabs().push(tab)
      @emit('add', tab)

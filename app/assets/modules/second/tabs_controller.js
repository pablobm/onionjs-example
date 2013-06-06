define([
  'onion/controller',
  'second/tabs_view'
], function (
  Controller,
  TabsView
) {

  return Controller.sub('TabsController')

    .view(TabsView)
    .models('tabs')

    .onView('editor', function () {
      this.tabs.select('editor')
    })

    .onView('display', function () {
      this.tabs.select('display')
    })

    .onModel('tabs', 'change:selection', 'selectCurrentTab')

    .after('init', function () {
      this.view.render()
      this.selectCurrentTab()
    })

    .proto({
      selectCurrentTab: function () {
        this.view.selectTab(this.tabs.selection())
      }
    })

})

define([
  'onion/mustache_view',
  'onion/vendor/text!second/tabs.mustache'
], function (
  MustacheView,
  template
) {

  return MustacheView.sub('TabsView')

    .template(template)

    .onDom('.editor', 'click', 'editor')
    .onDom('.display', 'click', 'display')

    .proto({
      selectTab: function (tab) {
        this.find('.tab').removeClass('current')
        this.find('.' + tab).addClass('current')
      }
    })

})

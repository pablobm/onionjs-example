define([
  'onion/mustache_view',
  'onion/vendor/text!second/display.mustache'
], function (
  MustacheView,
  template
) {

  return MustacheView.sub('DisplayView')

    .template(template)

    .proto({
      show: function () {
        this.$dom().show()
      },

      hide: function () {
        this.$dom().hide()
      },

      update: function (text) {
        text = text || ''
        html = '<p>' + text.replace(/\r?\n/g, '</p><p>') + '</p>'
        this.$dom().html(html)
      }
    })

})

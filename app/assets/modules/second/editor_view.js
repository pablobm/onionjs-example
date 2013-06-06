define([
  'onion/mustache_view',
  'onion/vendor/text!second/editor.mustache'
], function (
  MustacheView,
  template
) {

  return MustacheView.sub('EditorView')

    .template(template)

    .onDom('textarea', 'keyup', 'textChanged', function () {
      return this.find('textarea').val()
    })

    .proto({
      show: function () {
        this.$dom().show()
      },

      hide: function () {
        this.$dom().hide()
      }
    })

})

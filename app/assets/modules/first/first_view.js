define([
  'onion/mustache_view',
  'onion/vendor/text!first/first.mustache'
], function (
  MustacheView,
  template
) {

  return MustacheView.sub('FirstView')

    .template(template)

})

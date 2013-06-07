define([
  'onion/mustache_view',
  'onion/vendor/text!second/second.mustache'
], function (
  MustacheView,
  template
) {

  return MustacheView.sub('SecondView')

    .template(template)

})

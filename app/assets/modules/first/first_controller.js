define([
  'onion/controller',
  'first/first_view'
], function (
  Controller,
  FirstView
) {

  return Controller.sub('FirstController')

    .view(FirstView)

    .after('init', function () {
      this.view.render({me: 'first'})
    })

})

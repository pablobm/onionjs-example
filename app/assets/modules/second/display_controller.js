define([
  'onion/controller',
  'second/display_view'
], function (
  Controller,
  DisplayView
) {

  return Controller.sub('DisplayController')

    .view(DisplayView)
    .models('tabs', 'comment')

    .onModel('tabs', 'change:selection', 'showOrHide')
    .onModel('comment', 'change:body', 'updateText')

    .after('init', function () {
      this.view.render()
      this.showOrHide()
      this.updateText()
    })

    .proto({
      showOrHide: function () {
        if (this.tabs.selection() == 'display') {
          this.view.show()
        }
        else {
          this.view.hide()
        }
      },

      updateText: function () {
        this.view.update(this.comment.body())
      }
    })


})

define([
  'onion/controller',
  'second/editor_view'
], function (
  Controller,
  EditorView
) {

  return Controller.sub('EditorController')

    .view(EditorView)
    .models('tabs', 'comment')

    .onView('textChanged', 'textChanged')
    .onModel('tabs', 'change:selection', 'showOrHide')

    .after('init', function () {
      this.view.render()
      this.showOrHide()
    })

    .proto({
      showOrHide: function () {
        if (this.tabs.selection() == 'editor') {
          this.view.show()
        }
        else {
          this.view.hide()
        }
      },

      textChanged: function (text) {
        this.comment.setBody(text)
      }
    })

})

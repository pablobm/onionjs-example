    define([
      'onion/controller',
      'models/comment',
      'models/selector',
      'second/second_view',
      'second/tabs_controller',
      'second/editor_controller',
      'second/display_controller'
    ], function (
      Controller,
      Comment,
      Selector,
      SecondView,
      TabsController,
      EditorController,
      DisplayController
    ) {

      return Controller.sub('SecondController')

        .view(SecondView)

        .after('init', function () {
          this.newModel('comment', new Comment)
          this.newModel('tabs', new Selector)
          this.tabs.select('editor')
          this.view.render()
          this.setChild('tabs', TabsController)
          this.setChild('editor', EditorController)
          this.setChild('display', DisplayController)
        })

    })

# Event flow

The application we built in the previous chapter was not really very useful. It also failed to illustrate a basic principle of OnionJS's architecture: **events**. But first, we need to add a new element to the mix: **models**.

## Models

Models hold the state of the application. Anything that has a state, it has a model for it. Models can represent:

* Business objects: users, accounts, messages, notes...
* Interface elements: selectors, tabs, buttons, sliders...

Models are accessed and modified by controllers. When this happens, models emit events as a response. Other controllers listen to these events and act in consequence, telling the views to present the updated information.

OnionJS provides a class you can use to implement models: Struct. You'll see how to use in the examples below.

## A more "real" application

We are going to build a new OnionJS app. This time there will be more files than before, but each will still be small. In OnionJS, we tend to have many simple files that do only one thing and are easy to debug, rather than a few large and complicated files that too many things.

This is the simple application we will be building here:

============================
============================
Link or embed the app here
============================
============================
============================

Let's have a look at the code, reviewing one element at a time.

## Top level

    <!-- index.html -->
    <div id="second-app"></div>
    <script>
    require(['second/second_controller'], function(SecondController) {
      new SecondController().appendTo('#second-app')
    })
    </script>

No surprises here. We start this application the same way we started the previous one. Using RequireJS we load the main controller and append it to a element of the page.

## Comment model

First, there's a business object. Comments are elements of the application that surely will be posted somewhere after being written.

    define([
      'onion/struct'
    ], function(
      Struct
    ) {

      return Struct.sub('Comment')
        .attributes('body')
    })

Using the provided `Struct` class, we create a `Comment` model that will hold the details of the comment. In this case it's only the text body, but it could be more complex than that.

The declaration `.attributes('body')` creates an attribute in the struct, and adds the methods `.body()` and `.setBody()`, that act as getter and setter for this attribute. An example follows with two attributes instead:

    Comment = Struct.sub('Comment').attributes('body', 'title')
    comment = new Comment()
    comment.setTitle("The title")
    comment.setBody("This is the body")
    comment.title() // => "The title"
    comment.body() // => "This is the body"

Additionally, the struct will emit events when it changes:

    comment.on('change', function () {
        // This will fire on any change
    })

    comment.on('change:body', function () {
        // This will fire when the 'body' attribute changes
    })

## Selector model

Next we have another model, but this time it does not reflect a business object, but a UI element: the tabs that allow us to select the editor or the display.

    define([
      'onion/struct'
    ], function(
      Struct
    ) {

      return Struct.sub('Selector')

        .attributes('selection')

        .proto({
          select: function (val) {
            this.setSelection(val)
          }
        })
    })

This time we are adding a method to the struct: 'select'. This is really little more than an alias for 'setSelection'. We add it just because this is a selector, so surely we should be able to select! :-)

As with the Comment model, the events 'change' and 'change:selection' will be fired when the attribute 'selection' changes. This includes when changed using the 'select' method.

## Main controller ("Second" controller)

Now that we have the models, we can start building the application itself. It's made of several models, and the first one is the following:

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


Now this is a bit longer that we have seen so far, but it's all just setting up stuff. Let's look at the new elements:

    this.newModel('comment', new Comment)
    this.newModel('tabs', new Selector)

As mentioned before, we will be listening to the events fired by the models. OnionJS controllers provide several shortcuts for these. To take advantage of these, you must register the models first, which is what we do above.

Note that this specific controller doesn't do any listening, but its children controllers do. I haven't introduced the concept of children controllers yet, but we are almost there! For now, let's just say that this is the appropriate place to register these models because they will be shared by some other controllers down the line.

    this.tabs.select('editor')

When we register models, these become available as properties of the controller, and we can access them through the `this` keyword. In this case, we use this to set an initial value for the tabs.

    this.setChild('tabs', TabsController)
    this.setChild('editor', EditorController)
    this.setChild('display', DisplayController)


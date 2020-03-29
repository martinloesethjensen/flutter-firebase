summary: Add Firebase to Your Flutter App
id: flutter-firebase-workshop
categories: flutter, dart, firebase
tags: Flutter, Firebase
status: Draft
authors: Martin Løseth Jensen
Feedback Link: https://github.com/martinloesethjensen/flutter-firebase/issues/new

# Flutter Firebase Codelab

## Overview

In this codelab we want to show how to implement Firebase into a Flutter app.

We will build a chat app where users can log in / sign in with Firebase, interact with Firestore, upload images to Firebase Storage, push notifications and analytics. 

We will show how to setup up the app with Firebase and how to create a Firebase project.

## Prerequisite

Have a Google account that you will use for login to Firebase.
See the official prerequisites on the [Firebase documentation](https://firebase.google.com/docs/flutter/setup#prerequisites) 

To follow along you can download the project from GitHub.
TODO: Have url for download on GH 

Be able to run Flutter on either a simulator or physical device.
You can follow the steps in the Flutter website: [Getting Started](https://flutter.dev/docs/get-started)

Positive
: It is important to note that if you need to run an Android emulator then you need to install and [setup up the Android emulator in Android Studio](https://flutter.dev/docs/get-started/install/macos#set-up-the-android-emulator)

## Create a Flutter Project

When you have [Flutter setup](https://flutter.dev/docs/get-started/install) on your computer then you are ready to create the Flutter project. 

With this simple simple Flutter command you will create a sample / "skeleton" app and will be able to run right after creation.

```bash
flutter create flutter_firebase_chat
```

You can run the app from the terminal or run it in an IDE such as Android Studio, Intellij IDEA or VS Code (these editors has plugins for Flutter and dart support).
In the terminal navigate to the newly created project, `flutter_firebase_chat`, and run the `flutter run` command.   

```bash
cd flutter_firebase_chat
flutter run
```

Positive
: **Note:** you need to have a device or emulator connected / started for the app to run.
You can find [useful Flutter commands here](https://gist.github.com/martinloesethjensen/8b53ec97834aaea2622d57ec94d3fb5e).

## Build the User Interface

In this section, you'll begin modifying the default sample app into a chat app. The goal is to use [Flutter](https://flutter.io/) to build Friendlychat, a simple, extensible chat app with these features:

- The app displays text messages in real time.
- Users can enter a text string message and send it either by pressing the return key or the **Send** icon.
- The UI runs on both iOS and Android devices.

TODO: Screenshot

### Create the main app scaffold

The first element you'll add is a simple [app bar](https://www.google.com/design/spec/layout/structure.html#structure-app-bar) that shows a static title for the app. As you progress through subsequent sections of this codelab, you'll incrementally add more responsive and stateful UI elements to the app.

The `main.dart` file is located under the `lib` directory in your Flutter project and contains the [main()](https://www.dartlang.org/docs/dart-up-and-running/ch02.html#the-main-function) function that starts the execution of your app.

The [main()](https://www.dartlang.org/docs/dart-up-and-running/ch02.html#the-main-function) and [runApp()](http://docs.flutter.io/flutter/widgets/runApp.html) function definitions are the same as in the default app. The [runApp()](http://docs.flutter.io/flutter/widgets/runApp.html) function takes as its argument a [Widget](https://docs.flutter.io/flutter/widgets/Widget-class.html) which the Flutter framework expands and displays to the screen of the app at run time. Since the app uses Material Design elements in the UI, create a new [MaterialApp](http://docs.flutter.io/flutter/material/MaterialApp/MaterialApp.html) object and pass it to the [runApp()](http://docs.flutter.io/flutter/widgets/runApp.html) function; this widget becomes the root of your widget tree.

```dart
// Replace the code in main.dart with the following.

import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Friendlychat",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Friendlychat"),
        ),
      ),
    ),
  );
}
```

To specify the default screen that users see in your app, set the `home` argument in your [MaterialApp](http://docs.flutter.io/flutter/material/MaterialApp/MaterialApp.html) definition. The `home` argument references a widget that defines the main UI for this app. The widget consists of a [Scaffold](http://docs.flutter.io/flutter/material/Scaffold-class.html) widget that has a simple [AppBar](http://docs.flutter.io/flutter/material/AppBar/AppBar.html) as its child widget.

If you run the app, you should see a single screen that looks like this.

TODO: Screenshot

### Build the Chat Screen

To lay the groundwork for interactive components, you'll break the simple app into two different subclasses of widget: a root-level `FriendlychatApp` widget that never changes, and a child `ChatScreen` widget that can rebuild when messages are sent and internal state changes. For now, both these classes can extend [`StatelessWidget`](https://docs.flutter.io/flutter/widgets/StatelessWidget-class.html). Later, we'll modify `ChatScreen` to extend [`StatefulWidget`](https://docs.flutter.io/flutter/widgets/StatefulWidget-class.html) and manage state.

``` dart
// Replace the code in main.dart with the following.

import 'package:flutter/material.dart';

void main() {
  runApp(new FriendlychatApp());
}

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
    );
  }
}
```

This step introduces several key concepts of the Flutter framework:

- You describe the part of the user interface represented by a widget in its build method. The framework calls the `build()` methods for `FriendlychatApp` or `ChatScreen` when inserting these widgets into the widget hierarchy and when their dependencies change.
- [@override](https://api.dartlang.org/stable/1.24.2/dart-core/override-constant.html) is a Dart annotation that indicates that the tagged method overrides a superclass's method.
- Some widgets, like [Scaffold](https://docs.flutter.io/flutter/material/Scaffold-class.html) and [AppBar](https://docs.flutter.io/flutter/material/AppBar-class.html), are specific to [Material Design](https://material.io/) apps. Other widgets, like [Text](https://docs.flutter.io/flutter/widgets/Text-class.html), are generic and can be used in any app. Widgets from different libraries in the Flutter framework are compatible and can work together in a single app.

Click the hot reload button to see the changes almost instantly. After dividing the UI into separate classes and modifying the root widget, you should see no change:

TODO: Screenshot

## Add UI for Composing Messages

In this section, you'll learn how to build a user control that enables the user to enter and send text messages.

TODO: Screenshot

On a device, clicking on the text field brings up a soft keyboard. Users can send chat messages by typing a non-empty string and pressing the Return key on the soft keyboard. Alternatively, users can send their typed messages by pressing the graphical **Send** button next to the input field.

For now, the UI for composing messages is at the top of the chat screen but after we add the UI for displaying messages in the next step, it will move to the bottom of the chat screen.

### Add an Interactive Text Input Field

The Flutter framework provides a Material Design widget called [TextField](http://docs.flutter.io/flutter/material/TextField-class.html). It's a stateful widget (a widget that has mutable state) with properties for customizing the behavior of the input field. State is information that can be read synchronously when the widget is built and that might change during the lifetime of the widget. Adding the first stateful widget to Friendlychat requires making a few modifications.

In Flutter, if you want to visually present stateful data in a widget, you should encapsulate this data in a [State](http://docs.flutter.io/flutter/widgets/State-class.html) object. You can then associate your [State](http://docs.flutter.io/flutter/widgets/State-class.html) object with a widget that extends the [StatefulWidget](http://docs.flutter.io/flutter/widgets/StatefulWidget-class.html) class.

The following code snippet shows how you might start to define a class in your `main.dart` file to add the interactive text input field. First you'll change the `ChatScreen` class to subclass [StatefulWidget](http://docs.flutter.io/flutter/widgets/StatefulWidget-class.html) instead of [StatelessWidget](https://docs.flutter.io/flutter/widgets/StatelessWidget-class.html). While [TextField](http://docs.flutter.io/flutter/material/TextField-class.html) handles the mutable text content, state belongs at this level of the widget hierarchy because `ChatScreen` will have a text controller object. You'll also define a new `ChatScreenState` class that implements the [State](http://docs.flutter.io/flutter/widgets/State-class.html) object.

Override the [createState()](https://docs.flutter.io/flutter/widgets/StatefulWidget/createState.html) method as shown to attach the `ChatScreenState` class. You'll use the new class to build the stateful [TextField](http://docs.flutter.io/flutter/material/TextField-class.html) widget.

Add a line above the [build()](https://docs.flutter.io/flutter/widgets/State/build.html) method to define the `ChatScreenState` class:

```dart
// Modify the ChatScreen class definition to extend StatefulWidget.

class ChatScreen extends StatefulWidget {                     //modified
  @override                                                        //new
  State createState() => new ChatScreenState();                    //new
} 

// Add the ChatScreenState class definition in main.dart.

class ChatScreenState extends State<ChatScreen> {                  //new
  @override                                                        //new
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),

    );
  }
}
```

Now the [build()](https://docs.flutter.io/flutter/widgets/State/build.html) method for `ChatScreenState` should include all the widgets formerly in the `ChatScreen` part of the widget tree. When the framework calls the [build()](https://docs.flutter.io/flutter/widgets/State/build.html) method to refresh the UI, it can rebuild `ChatScreenState` with its tree of children widgets.

Positive
: **Tip:** It's often useful to view the source code definition of Flutter's framework APIs to get a better understanding of what's going on behind the scenes. You can do this easily from IntelliJ's editor panel by selecting a class or method name, then right-clicking and selecting the **Go to Declaration** option. Depending on the OS, you can also click while pressing the Command or Control button on the keyboard. [See more options and keyboard shortcuts](https://flutter.io/intellij-ide/#tips-and-tricks).

Now that your app has the ability to manage state, you can build out the `ChatScreenState` class with an input field and send button.

To manage interactions with the text field, it's helpful to use a [TextEditingController](https://docs.flutter.io/flutter/widgets/TextEditingController-class.html) object. You'll use it for reading the contents of the input field, and for clearing the field after the text message is sent. Add a line to the `ChatScreenState` class definition to create this object.

```dart
// Add the following code in the ChatScreenState class definition.

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController(); //new
```

The following code snippet shows how you can define a private method called `_buildTextComposer()` that returns a [Container](https://docs.flutter.io/flutter/widgets/Container-class.html) widget with a configured [TextField](http://docs.flutter.io/flutter/material/TextField-class.html) widget.

```dart
// Add the following code in the ChatScreenState class definition.

Widget _buildTextComposer() {
  return new Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    child: new TextField(
      controller: _textController,
      onSubmitted: _handleSubmitted,
      decoration: new InputDecoration.collapsed(
        hintText: "Send a message"),
    ),
  );
}
```

Start with a [Container](https://docs.flutter.io/flutter/widgets/Container-class.html) widget that adds a horizontal margin between the edge of the screen and each side of the input field. The units here are logical pixels that get translated into a specific number of physical pixels, depending on a device's pixel ratio. You might be familiar with the equivalent term for iOS (*points*) or for Android (*density-independent pixels*).

Add a [TextField](http://docs.flutter.io/flutter/material/TextField-class.html) widget and configure it as follows to manage user interactions:

- To have control over the contents of the text field, we'll provide the `TextField` constructor with a `TextEditingController`. This controller can also be used to clear the field or read its value.
- To be notified when the user submits a message, use the [onSubmitted](https://docs.flutter.io/flutter/material/TextField/onSubmitted.html) argument to provide a private callback method `_handleSubmitted()`. For now, this method will just clear the field, and later on we'll add more to code to send the message. Define this method as follows:

```dart
// Add the following code in the ChatScreenState class definition.

void _handleSubmitted(String text) {
  _textController.clear();
}
```

**Tip:** Prefixing an identifier with an _ (underscore) makes it private to its class. The Dart compiler enforces privacy. See dartlang.org for more details on [libraries and visibility](https://www.dartlang.org/guides/language/language-tour#libraries-and-visibility) in Dart.

### Place the Text Composer Widget

Now, tell the app how to display the text input user control. In the [build()](http://docs.flutter.io/flutter/material/State/build.html) method of your `ChatScreenState` class, attach a private method called `_buildTextComposer` to the [body](https://docs.flutter.io/flutter/material/Scaffold/body.html) property. The `_buildTextComposer` method returns a widget that encapsulates the text input field.

```dart
// Modify the code in the ChatScreenState class definition as follows.

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),

      body: _buildTextComposer(), //new
    );
  }
```

Hot reload the app. You should see a single screen that looks like this.

TODO: Screenshot

### Add a Responsive Send Button

Next, we'll add a 'Send' button to the right of the text field. Since we want to display the button adjacent to the input field, we'll use a [Row](https://docs.flutter.io/flutter/widgets/Row-class.html) widget as the parent.

Then wrap the [TextField](http://docs.flutter.io/flutter/material/TextField-class.html) widget in a [Flexible](https://docs.flutter.io/flutter/widgets/Flexible-class.html) widget. This tells the [Row](https://docs.flutter.io/flutter/widgets/Row-class.html) to automatically size the text field to use the remaining space that isn't used by the button.

```dart
// Modify the _buildTextComposer method with the code below to arrange the 
// text input field and send button.

Widget _buildTextComposer() {
  return new Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    child: new Row(                                            //new
      children: <Widget>[                                      //new
        new Flexible(                                          //new
          child: new TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
              hintText: "Send a message"),
          ),
        ),                                                      //new
      ],                                                        //new
    ),                                                          //new
  );
}
```

You can now create an [IconButton](http://docs.flutter.io/flutter/material/IconButton-class.html) widget that displays the **Send** icon. In the `icon` property, use the [Icons.send](https://docs.flutter.io/flutter/material/Icons/send-constant.html) constant to create a new [Icon](https://docs.flutter.io/flutter/material/Icons-class.html) instance. This constant indicates that your widget uses the following ‘Send' icon provided by the material icons library.

Positive
: **Tip:** For a list of the standard Material Design icons, refer to the [Material Icons](https://material.io/icons/) site and the constants in the [Icons](http://docs.flutter.io/flutter/material/Icons-class.html) class.

Put your [IconButton](http://docs.flutter.io/flutter/material/IconButton-class.html) widget inside another [Container](https://docs.flutter.io/flutter/widgets/Container-class.html) parent widget; this lets you customize the margin spacing of the button so that it visually fits better next to your input field. For the [onPressed](https://docs.flutter.io/flutter/material/IconButton/onPressed.html) property, use an anonymous function to also invoke the `_handleSubmitted()` method and use `_textController` to pass it the contents of the message.

```dart
// Modify the _buildTextComposer method with the code below to define the 
// send button.

Widget _buildTextComposer() {
  return new Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    child: new Row(
      children: <Widget>[
        new Flexible(
          child: new TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
              hintText: "Send a message"),
          ),
        ),
        new Container(                                                 //new
          margin: new EdgeInsets.symmetric(horizontal: 4.0),           //new
          child: new IconButton(                                       //new
            icon: new Icon(Icons.send),                                //new
            onPressed: () => _handleSubmitted(_textController.text)),  //new
        ),                                                             //new
      ],
    ),
  );
}
```

Positive
: **Tip:** In Dart syntax, the fat arrow function declaration `=> expression` is shorthand for `{ return expression; }`.

For an overview of Dart function support, including anonymous and nested functions, see the [Dart Language Tour](https://www.dartlang.org/guides/language/language-tour).

The color of the button is black, from the default Material Design theme. To give the icons in your app an accent color, pass the color argument to IconButton. Alternatively, you can apply a different theme.

Icons inherit their color, opacity, and size from an [IconTheme](https://docs.flutter.io/flutter/material/IconTheme-class.html) widget, which uses an [IconThemeData](https://docs.flutter.io/flutter/material/IconThemeData-class.html) object to define these characteristics. Wrap all the widgets in the `_buildTextComposer()` method in an [IconTheme](https://docs.flutter.io/flutter/material/IconTheme-class.html) widget, and use its [data](https://docs.flutter.io/flutter/material/IconTheme/data.html) property to specify the [ThemeData](https://docs.flutter.io/flutter/material/ThemeData-class.html) object of the current theme. This gives the button (and any other icons in this part of the widget tree) the accent color of the current theme.

```dart
// Modify the _buildTextComposer method with the code below to give the 
// send button the current theme's accent color.

Widget _buildTextComposer() {
  return new IconTheme(                                            //new
    data: new IconThemeData(color: Theme.of(context).accentColor), //new
    child: new Container(                                     //modified
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                hintText: "Send a message"),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text)),
          ),
        ],
      ),
    ),                                                             //new
  );
}
```

A [BuildContext](https://docs.flutter.io/flutter/widgets/BuildContext-class.html) object is a handle to the location of a widget in your app's widget tree. Each widget has its own [BuildContext](https://docs.flutter.io/flutter/widgets/BuildContext-class.html), which becomes the parent of the widget returned by the [StatelessWidget.build](https://docs.flutter.io/flutter/widgets/StatelessWidget/build.html) or [State.build](https://docs.flutter.io/flutter/widgets/State/build.html) function. This means the `_buildTextComposer()` method can access the [BuildContext](https://docs.flutter.io/flutter/widgets/BuildContext-class.html) object from its encapsulating [State](https://docs.flutter.io/flutter/widgets/State-class.html) object; you don't need to pass the context to the method explicitly.

Hot reload the app. You should see a screen that looks like this.

TODO: Screenshot

## Add UI for Displaying Messages

Dhsujd

## Apply Finnishing Touches

egwbdaj

## Create a Firebase Project

If you don't already have a Firebase account, then you can create one [here](https://firebase.google.com/pricing/). We will not be needing a paid plan for this codelab. 

1. Sign in to [Firebase Console](https://console.firebase.google.com/)

2. Go ahead and click "Add project"

   ![Screenshot 2020-03-28 at 00.19.02](/Users/mlj/Dropbox/projects/flutter-firebase/img/firebase-step-1.png)

3. Enable Google Analytics
   ![firebase-step-2](/Users/mlj/Dropbox/projects/flutter-firebase/img/firebase-step-2.png)

4. You can then choose to either configure Google Analytics with existing Google Analytics account or create a new account name.

   ![firebase-step-3](/Users/mlj/Dropbox/projects/flutter-firebase/img/firebase-step-3.png)

## Configure the Platforms

The next step for us to do is configure one or more apps to our Firebase project. We will do this by registering the app's bundle ID with Firebase and then generate config files to put in the our project. 

![configure-platforms](/Users/mlj/Dropbox/projects/flutter-firebase/img/configure-platforms.png)



### Android Configuration

You can find a detailed description on how to [add Firebase to your Flutter app with Android configuration](https://firebase.google.com/docs/flutter/setup?platform=android). 

### iOS Configuration

You can find a detailed description on how to [add Firebase to your Flutter app with iOS configuration](https://firebase.google.com/docs/flutter/setup?platform=ios). 
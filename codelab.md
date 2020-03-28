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

The `main.dart` file is located under the `lib` directory in your Flutter project and contains the [`main()`](https://www.dartlang.org/docs/dart-up-and-running/ch02.html#the-main-function) function that starts the execution of your app.

The [`main()`](https://www.dartlang.org/docs/dart-up-and-running/ch02.html#the-main-function) and [`runApp()`](http://docs.flutter.io/flutter/widgets/runApp.html) function definitions are the same as in the default app. The [`runApp()`](http://docs.flutter.io/flutter/widgets/runApp.html) function takes as its argument a [`Widget`](https://docs.flutter.io/flutter/widgets/Widget-class.html) which the Flutter framework expands and displays to the screen of the app at run time. Since the app uses Material Design elements in the UI, create a new [`MaterialApp`](http://docs.flutter.io/flutter/material/MaterialApp/MaterialApp.html) object and pass it to the [`runApp()`](http://docs.flutter.io/flutter/widgets/runApp.html) function; this widget becomes the root of your widget tree.

### [**main.dart**](https://github.com/flutter/friendlychat-steps/blob/master/offline_steps/step_1_main_user_interface/lib/main.dart)

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

To specify the default screen that users see in your app, set the `home` argument in your [`MaterialApp`](http://docs.flutter.io/flutter/material/MaterialApp/MaterialApp.html) definition. The `home` argument references a widget that defines the main UI for this app. The widget consists of a [`Scaffold`](http://docs.flutter.io/flutter/material/Scaffold-class.html) widget that has a simple [`AppBar`](http://docs.flutter.io/flutter/material/AppBar/AppBar.html) as its child widget.

If you run the app, you should see a single screen that looks like this.

TODO: Screenshot

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
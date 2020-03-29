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
flutter create gdg_flutter_firebase_chat
```

You can run the app from the terminal or run it in an IDE such as Android Studio, Intellij IDEA or VS Code (these editors has plugins for Flutter and dart support).
In the terminal navigate to the newly created project, `gdg_flutter_firebase_chat`, and run the `flutter run` command.   

```bash
cd gdg_flutter_firebase_chat
flutter run
```

Positive
: **Note:** you need to have a device or emulator connected / started for the app to run.
You can find [useful Flutter commands here](https://gist.github.com/martinloesethjensen/8b53ec97834aaea2622d57ec94d3fb5e).

## Start Building

Now that we can run our Flutter code on an emulator or device, we will try to build something for ourself.
We will now remove all the code in the `main.dart` file and fill in with this code below.

```dart
import 'package:flutter/material.dart';
 
void main() {
  runApp(
    MaterialApp(
      title: "GDG Firebase chat",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GDG Firebase chat"),
        ),
      ),
    ),
  );
}
```

Let us delete the `test` folder as we will not be needing that in this codelab.
You can do it via the terminal, folder or IDE.

In the terminal you can use this command:

```bash
rm -r test/
```

Now we will create a new folder in the `lib` folder. Let us name the folder `helpers`, and the purpose of this folder is to have files with code that will be used througout the project. Such an example could be constants like colours.

You can do it via the terminal, folder or IDE.

In the terminal you can use this command:

```bash
cd lib
mkdir helpers
```

While we are at it we will make a new dart file in that folder, `app_constants.dart`.

Your structure should look like this.

![folder_structure_01](/Users/mlj/Dropbox/projects/flutter-firebase/img/folder_structure_01.png)

## Build the User Interface

TODO:

## Add UI for Composing Messages

TODO:

## Add UI for Displaying Messages

TODO:

## Apply Finnishing Touches

TODO:

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
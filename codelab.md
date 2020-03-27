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

## About Firebase

TODO: write about Firebase

## Prerequisite

Have a Google account that you will use for login to Firebase.
See the official prerequisites on the [Firebase documentation](https://firebase.google.com/docs/flutter/setup#prerequisites) 

To follow along you can download the project from GitHub.
TODO: Have url for download on GH 

Be able to run Flutter on either a simulator or physical device.
You can follow the steps in the Flutter website: [Getting Started](https://flutter.dev/docs/get-started)

Positive
: It is importent to note that if you need to run an Android emulator then you need to install and [setup up the Android emulator in Android Studio](https://flutter.dev/docs/get-started/install/macos#set-up-the-android-emulator)

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

## Create a Firebase Project

TODO: add images and instructions

If you don't already have a Firebase account, then you can create one [here](https://firebase.google.com/pricing/). We will not be needing a paid plan for this codelab. 

1. Sign in to [Firebase Console](https://console.firebase.google.com/)

2. Go ahead and click "Add project"

   ![Screenshot 2020-03-28 at 00.19.02](/Users/mlj/Dropbox/projects/flutter-firebase/img/firebase-step-1.png)

3. Enable Google Analytics
   ![firebase-step-2](/Users/mlj/Dropbox/projects/flutter-firebase/img/firebase-step-2.png)

4. You can then choose to either configure Google Analytics with existing Google Analytics account or create a new account name.

   ![firebase-step-3](/Users/mlj/Dropbox/projects/flutter-firebase/img/firebase-step-3.png)

## Configure the Platforms

dhsbds

### Android Configuration

dsjnds

### iOS Configuration

Dsjdnjs
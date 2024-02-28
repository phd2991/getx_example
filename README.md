# getx_example

## Requirements

- Flutter 3.10.x  
- Xcode 14.x  
- Android SDK 33

## Recommend IDE Plugins

- Material Icon Theme  
- Flutter GetX Snippets  
- Flutter Intl  
- Flutter freezed Helpers  

## Generate files
Execute the following command to generate files:

```
dart run build_runner build -d
```

or watch command in order to keep the source code synced automatically:

```
dart run build_runner watch -d
```

> `-d` or `--delete-conflicting-outputs`: Assume conflicting outputs in the users package are from previous builds, and skip the user prompt that would usually be provided.

### Group Generated Files

In-order to group `.freezed.dart` and `.g.dart` files so they are hidden from the project view but not ignored, we can use File nesting, for
[Android Studio](https://www.jetbrains.com/help/idea/file-nesting-dialog.html) and
[VS Code](https://dev.to/this-is-learning/file-nesting-in-vs-code-46l5).

## Enviroment

### Flavors

Use Very Good CLI to create Flutter apps pre-configured with build flavors as well as many other useful features.

```
dart pub global activate very_good_cli
```
```
very_good create --org-name com.example app
```

### Firebase

Use the FlutterFire CLI to configure apps to connect to Firebase.
```
npm install -g firebase-tools
```
```
firebase login
```
```
dart pub global activate flutterfire_cli
```
```
# Dev environment (note: do the same for Stg and Prod)
flutterfire config \
  --project=app-dev \
  --out=lib/firebase_options_dev.dart \
  --ios-bundle-id=com.example.app.dev \
  --macos-bundle-id=com.example.app.dev \
  --android-app-id=com.example.app.dev
```

> If you have multiple build variants that are based on release status (rather than on common end-user activity or access, like above), register each variant with a separate Firebase project.

## Deployment

### Requirement

- Install [fastlane](https://docs.fastlane.tools/getting-started/ios/setup/)

### CLI

Development:
```
fastlane dev
```

Staging:
```
fastlane stg
```

# Locate Me
## _Naviagte between cordinates smoothly_

![Alt Text](https://luckyapp.in/test/screen_Record.gif)

## Setup
Make sure you have flutter SDK configured
This project uses Flutter SDK vesion : 3.16.8
```sh
Flutter 3.16.8 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 67457e669f (5 weeks ago) • 2024-01-16 16:22:29 -0800
Engine • revision 6e2ea58a5c
Tools • Dart 3.2.5 • DevTools 2.28.5
```
### Project Setup
Clone project using below url
https://github.com/nikhilishwarkulal/LocateMe
Then open the flutter project in Android studio or Visual studio code. Once done you need to configure Firebase and Google Maps.


### Google Maps Setup
Go to manifest file of the project (`android/app/src/main/AndroidManifest.xml`).
and then change the below code:
```xml
 <meta-data android:name="com.google.android.geo.API_KEY"
    android:value="GOOGLE_API_KEY_CHANGE_HERE_TO_RUN_BUT_DO_NOT_PUSH"/>
```
change `android:value="GOOGLE_API_KEY_CHANGE_HERE_TO_RUN_BUT_DO_NOT_PUSH"` with your new Key.

Get a new API key at https://cloud.google.com/maps-platform/.

### Firebase App Setup
In your project got to `android/app/google-services.json` and replace it with your `google-service.json`.

Add Firebase to your Android project https://firebase.google.com/docs/android/setup

Then go to `lib/firebase_option.dart` configure `FirebaseOptions`  with your new configuration as given in below code.


```dart
 static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'AIza***************4GY',
  appId: '1:220815*************cbb02b',
  messagingSenderId: '2208*****2354',
  projectId: 'locate-me-***ad',
  storageBucket: 'locate-me-***ad.appspot.com',
);
```
You can find all this information inside `android/app/google-services.json` check the corresponding keys in below table.
| google-services.json | firebase_option.dart |
| ------ | ------ |
| current_key | apiKey |
| mobilesdk_app_id | appId |
| project_number | messagingSenderId |
| project_id | projectId |
| storage_bucket | storageBucket |




# React Native Firebase Crash Report

[![npm version](https://badge.fury.io/js/react-native-firebase-crash-report.svg)](https://badge.fury.io/js/react-native-firebase-crash-report)
[![npm downloads](https://img.shields.io/npm/dm/react-native-firebase-crash-report.svg?maxAge=2592000)](https://img.shields.io/npm/dm/react-native-firebase-crash-report.svg?maxAge=2592000)

React Native Firebase Crash Report With Custom Log

## Usage

```javascript

import FirebaseCrash from 'react-native-firebase-crash-report';

/*
 * Create custom log messages that will be included in the crash report
 */

FirebaseCrash.log('User logged in');

/*
 * Create custom log messages that will be included in the crash report and output to logcat/NSLog
 */

FirebaseCrash.logcat('User logged in');

// Android only
// Params:
// - message: string, required
// - debug level: int, optional, default 3 (https://developer.android.com/reference/android/util/Log.html)
// - tag: string, optional, default 'RNFirebaseCrashReport'
FirebaseCrash.logcat('User logged in', 3, 'MyTag');

/*
 * Android only
 * Report errors on demand
 */

FirebaseCrash.report('A weird thing just happened...');

```

## Installation

- Install node module

```bash
npm install --save react-native-firebase-crash-report
```

- Linking libraries

```bash
rnpm link react-native-firebase-crash-report
```

## iOS Configuration

### Install Firebase From Cocoapods

For more information please visit [Set Up Crash Reporting For iOS][1]

#### Pre-check

If you are using RN < 0.29 you would have run into [this problem][4], just follow the PR to fix it manually.

#### Go to your project's ios folder

```bash
cd <your_project>/ios
```

#### (Optional) Initialise Pod

**Note**: You can skip this step if you have pod initialised already.

```bash
pod init
```

#### Add `pod 'Firebase/Core'` and `pod 'Firebase/Crash'` to `Podfile`

```diff
 target 'YourProject' do
   # Uncomment this line if you're using Swift or would like to use dynamic frameworks
   use_frameworks!

   # Pods for YourProject
+  pod 'Firebase/Core'
+  pod 'Firebase/Crash'

   target 'YourProjectTests' do
     inherit! :search_paths
     # Pods for testing
   end

 end
```

#### Install Pods

```bash
pod install
```

### Initialise Firebase

Add following code in your `AppDelegate.m`

```diff
 #import "AppDelegate.h"

 #import "RCTRootView.h"

+@import Firebase;

 @implementation AppDelegate

 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {

   ...

   self.window.rootViewController = rootViewController;
   [self.window makeKeyAndVisible];
+
+  // Use Firebase library to configure APIs
+  [FIRApp configure];
+
   return YES;
 }
```

## Android Configuration

For more information please visit [Set Up Crash Reporting For Android][2]

### Upgrade Google Play Services and Google Repository

![Upgrade Google Play Services and Google Repository](https://github.com/ianlin/react-native-firebase-crash-report/blob/master/img/upgrade_play_services.png)

### Add Google Services

- In `android/build.gradle`

```diff
     dependencies {
         classpath 'com.android.tools.build:gradle:1.3.1'
         classpath 'de.undercouch:gradle-download-task:2.0.0'
+        classpath 'com.google.gms:google-services:3.0.0'
```

- In `android/app/build.gradle`, add this line at the bottom of the file

```gradle
apply plugin: 'com.google.gms.google-services'
```

## Contributing

Any pull requests, issue reports and suggestion are highly welcome.

## License

[ISC License][5] (functionality equivalent to **MIT License**)

[1]: https://firebase.google.com/docs/crash/ios
[2]: https://firebase.google.com/docs/android/setup
[3]: https://github.com/rnpm/rnpm
[4]: https://github.com/facebook/react-native/pull/7927
[5]: https://opensource.org/licenses/ISC

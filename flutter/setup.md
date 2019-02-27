## create new flutter app
```shell
flutter create \
  --org com.kentahara \
  -i swift \
  -a kotlin \
  --with-driver-test \
  app_name
```

## setup firebae
- https://firebase.google.com/docs/flutter/setup?hl=ja

### failed to run on android emulator
#### error1
```
FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:preDebugBuild'.
> Android dependency 'com.android.support:support-core-ui' has different version for the compile (26.1.0) and runtime (27.1.1) classpath. You should manually set the same version via DependencyResolution

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org
```

android/build.gradleに下記を追加した
```
subprojects {
  project.configurations.all {
     resolutionStrategy.eachDependency { details ->
        if (details.requested.group == 'com.android.support'
              && !details.requested.name.contains('multidex') ) {
           details.useVersion "27.1.1"
        }
     }
  }
}
```

#### error2
```
	uses-sdk:minSdkVersion 16 cannot be smaller than version 19 declared in library [:multi_image_picker] /Users/kentahara/DouZen/bebefoto/build/multi_image_picker/intermediates/merged_manifests/debug/processDebugManifest/merged/AndroidManifest.xml as the library might be using APIs not available in 16
	Suggestion: use a compatible library with a minSdk of at most 16,
		or increase this project's minSdk version to at least 19,
		or use tools:overrideLibrary="com.vitanov.multiimagepicker" to force usage (may lead to runtime failures)

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:processDebugManifest'.
> Manifest merger failed : uses-sdk:minSdkVersion 16 cannot be smaller than version 19 declared in library [:multi_image_picker] /Users/kentahara/DouZen/bebefoto/build/multi_image_picker/intermediates/merged_manifests/debug/processDebugManifest/merged/AndroidManifest.xml as the library might be using APIs not available in 16
  	Suggestion: use a compatible library with a minSdk of at most 16,
  		or increase this project's minSdk version to at least 19,
  		or use tools:overrideLibrary="com.vitanov.multiimagepicker" to force usage (may lead to runtime failures)

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 9s
```

- https://sh1d0w.github.io/multi_image_picker/#/androudtroubleshooting


#### error3
```
The number of method references in a .dex file cannot exceed 64K.
  Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html
  ```
Add `multiDexEnabled true` to `android/app/build.gradle` , `defaultConfig`

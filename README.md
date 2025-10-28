# SigDuty

SigDuty is a minimal Android application built with Kotlin and Jetpack Compose. It is configured to build using:

- Gradle 8.4 (wrapper)
- Kotlin 1.9.10
- Android SDK 34
- Jetpack Compose 1.6.0

This repository includes a GitHub Actions workflow to build the debug APK on push or pull request to the main branch.

Features:
- Simple Compose-based "Hello, SigDuty!" app.
- Proper Gradle and Kotlin configuration for Android Gradle Plugin 8.4.0 and Kotlin 1.9.10.
- CI workflow for automated builds on GitHub Actions.

Prerequisites:
- Java JDK 17
- Android SDK 34 (for local builds)
- Git (to clone the repo)

Installation and Build (Local):
1. Clone the repository:
   git clone <repo-url>
   cd SigDuty

2. Ensure JAVA_HOME is set to a JDK 17 installation:
   export JAVA_HOME=/path/to/jdk17

3. Ensure ANDROID_SDK_ROOT is set to an Android SDK installation containing API 34:
   export ANDROID_SDK_ROOT=/path/to/android-sdk

4. Make the Gradle wrapper executable (Linux/macOS):
   chmod +x ./gradlew

5. Build the debug APK:
   ./gradlew assembleDebug

Configuration:
- All sensitive configuration is expected to come from environment variables (JAVA_HOME, ANDROID_SDK_ROOT).
- No local.properties is checked in. Configure your local Android SDK path via ANDROID_SDK_ROOT.

How to run (Local):
- After building, locate the APK at:
  app/build/outputs/apk/debug/app-debug.apk

Usage Example:
- Install the APK on a device/emulator:
  adb install -r app/build/outputs/apk/debug/app-debug.apk

Troubleshooting:
- If the Gradle wrapper fails due to a missing gradle-wrapper.jar, ensure the file exists at gradle/wrapper/gradle-wrapper.jar.
- If builds fail due to SDK packages missing, install platform 34 and build-tools 34.0.0 via sdkmanager:
  yes | sdkmanager "platforms;android-34" "build-tools;34.0.0"
- Ensure JAVA_HOME points to JDK 17 and that your PATH includes adb if installing to a device.

Project Structure:
- gradlew, gradlew.bat - Gradle wrapper scripts
- gradle/wrapper/gradle-wrapper.properties - Wrapper configuration
- build.gradle - Root Gradle configuration
- gradle.properties - JVM and Kotlin settings
- settings.gradle - Project modules
- app/ - Android application module
  - build.gradle - Module Gradle configuration
  - src/main/AndroidManifest.xml - App manifest
  - src/main/java/com/example/sigduty/MainActivity.kt - Main Compose activity
  - src/main/res/ - Resources (strings, themes, colors, layouts, drawables)
  - proguard-rules.pro - ProGuard rules for release
- .github/workflows/android.yml - CI workflow to build using GitHub Actions

CI:
- The included GitHub Actions workflow will install required Android SDK packages and run:
  ./gradlew assembleDebug

License:
- This project is licensed under the Apache License 2.0. See LICENSE.txt for details.

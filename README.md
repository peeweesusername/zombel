# Zombel

Simple Flutter E-Book application.  E-Book contents in assets/

To build:

1) Follow these instructions to setup Flutter - https://flutter.dev/docs/get-started/install/windows
2) Sync the repo
3) Launch Android Studio
4) Open the zombel project
5) Select your device
6) In the terminal execute the following:
   - flutter pub get
   - flutter pub run flutter_launcher_icons:main
6) Launch emuldate phone via AVD or connect phone via USB for debugging
7) Click the green run button

Note:

 For the package flutter_launcher_icons 0.9.2 you might have to edit flutter\.pub-cache\hosted\pub.dartlang.org\flutter_launcher_icons-0.9.2\lib as follows:
 
  -const String androidGradleFile = 'android/app/build.gradle';
  
  +const String androidGradleFile = 'android/local.properties';
  

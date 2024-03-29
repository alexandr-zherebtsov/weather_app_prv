# Weather App (Provider)

Weather Application

### Platforms
```
1 - Android
2 - iOS
3 - Web
4 - Chrome Extension
5 - Firefox Extension
```

### Libraries & Tools

- [Flutter 3.0.4 • channel stable](https://flutter.dev)
- [Dart 2.17.5](https://dart.dev)
- [DevTools 2.12.2](https://docs.flutter.dev/development/tools/devtools/overview)

State Manager
- [provider](https://github.com/rrousselGit/provider)

DI
- [get_it](https://github.com/fluttercommunity/get_it)

Router
- [go_router](https://github.com/flutter/packages/tree/main/packages/go_router)
  
Local Storage
- [shared_preferences](https://github.com/flutter/plugins/tree/main/packages/shared_preferences/shared_preferences)

Localization
- [easy_localization](https://github.com/aissat/easy_localization)

Network
- [dio](https://github.com/flutterchina/dio)
- [pretty_dio_logger](https://github.com/Milad-Akarie/pretty_dio_logger)

Location
- [geolocator](https://github.com/baseflow/flutter-geolocator/tree/main/geolocator)
- [geocoding](https://github.com/baseflow/flutter-geocoding)

UI
- [fluttertoast](https://github.com/PonnamKarthik/FlutterToast)

Utils
- [url_strategy](https://github.com/simpleclub/url_strategy)
- [url_launcher](https://github.com/flutter/plugins/tree/main/packages/url_launcher/url_launcher)
- [universal_html](https://github.com/dint-dev/universal_html)
- [package_info_plus](https://github.com/fluttercommunity/plus_plugins/tree/main/packages/package_info_plus)
- [connectivity_plus](https://github.com/fluttercommunity/plus_plugins/tree/main/packages/connectivity_plus)
- [permission_handler](https://github.com/baseflow/flutter-permission-handler)

Dev Dependencies
- [flutter_lints](https://github.com/flutter/packages/tree/main/packages/flutter_lints)
- [flutter_launcher_icons_maker](https://github.com/gsmlg-dev/flutter_launcher_icons_maker)

### Directory Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
|- web
```

Here is the folder structure we have been using in this project

```
lib/
|- data/
|- domain/
|- presentation/
|- shared/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1 - data - Contains the data layer of project, includes directories for local, network and shared pref/cache.
2 - domain - Contains abstraction and business logic of project, includes models, responses, request, etc.
3 - presentation - Contains all the ui of project, contains sub directory for each screen.
4 - shared - Contains the utilities/common functions, styles of application.
5 - main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title etc.
```

### Web

Extensions are built from the web directory. Before the build, add or replace the files from the web_resources directory. It is not possible to use the debug mode for extensions, you need to download the build to the browser.

To build Web Application use files from web_resources => web_application and use command
```
flutter build web --web-renderer html --release
```

To build Chrome Extension use files from web_resources => chrome_extension and use command
```
flutter build web --web-renderer html --release --csp
```

Open Chrome and upload build to
```
chrome://extensions
```

To build Firefox Extension use files from web_resources => firefox_extension and use command
```
flutter build web --web-renderer html --release --csp
```

Open Firefox and upload build to
```
about:debugging#/runtime/this-firefox
```

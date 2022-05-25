# Weather App (Prv)

Weather Application

### Platforms
```
1 - Android
2 - iOS
3 - Web
```

### Libraries & Tools

- [Flutter Channel stable, 2.10.5](https://flutter.dev)

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
- [cupertino_icons](https://github.com/flutter/packages/tree/master/third_party/packages/cupertino_icons)

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
1- data - Contains the data layer of project, includes directories for local, network and shared pref/cache.
2- domain - Contains abstraction and business logic of project, includes models, responses, request, etc.
3- presentation - Contains all the ui of project, contains sub directory for each screen.
4- shared - Contains the utilities/common functions, styles of application.
5- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_media_station_base/globals/auth_globals.dart';
import 'package:open_media_station_base/globals/platform_globals.dart';
import 'package:open_media_station_base/helpers/preferences.dart';
import 'package:open_media_station_base/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  static Future start(List<String> args, Widget child, String title) async {
    await PlatformGlobals.setGlobals();

    args = args.map((arg) => arg.toLowerCase()).toList();
    if (args.contains('--kiosk')) {
      PlatformGlobals.isKiosk = true;
      PlatformGlobals.isTv = true;
    }
    if (args.contains('--tv')) {
      PlatformGlobals.isTv = true;
    }

    var prefs = await SharedPreferences.getInstance();
    Preferences.prefs = prefs;

    if (PlatformGlobals.isKiosk) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      if (Platform.isLinux) {
        try {
          await const MethodChannel('my_app/fullscreen')
              .invokeMapMethod('enableFullscreen');
        } on PlatformException catch (e) {
          log("Failed to enable fullscreen: '${e.message}'.");
        }
      }
    }

    runApp(
      OpenMediaStationApp(
        title: title,
        child: child,
      ),
    );
  }
}

class OpenMediaStationApp extends StatelessWidget {
  const OpenMediaStationApp({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // For authentication in web
        if (settings.name?.contains("code") ?? false) {
          AuthGlobals.appLoginCodeRoute = settings.name;
        }

        return null;
      },
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: LoginView(
        widget: child,
        title: title,
      ),
    );
  }
}

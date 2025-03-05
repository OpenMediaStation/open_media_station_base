import 'package:flutter/foundation.dart';
import 'package:open_media_station_base/helpers/preferences.dart';
import 'package:open_media_station_base/models/auth/auth_info.dart';

class AuthGlobals {
  static String get redirectUriWeb {
    if (kDebugMode) {
      return "http://localhost:8000/redirect.html";
    } else {
      return "https://${Preferences.prefs?.getString("BaseUrl")}/redirect.html";
    }
  }

  static String? appLoginCodeRoute;

  static AuthInfo? authInfo;
}

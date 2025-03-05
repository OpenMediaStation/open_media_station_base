import 'dart:convert';
import 'package:open_media_station_base/apis/base_api.dart';
import 'package:open_media_station_base/helpers/http_wrapper.dart' as http;
import 'package:open_media_station_base/helpers/preferences.dart';
import 'package:open_media_station_base/models/auth/auth_info.dart';

class AuthInfoApi {
  Future<AuthInfo> getAuthInfo() async {
    String apiUrl = "${Preferences.prefs?.getString("BaseUrl")}/auth/info";

    var headers = await BaseApi.getRefreshedHeaders();

    var response = await http .get(
      Uri.parse(apiUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      return AuthInfo.fromJson(decoded);
    } else {
      throw Exception('Failed to load auth info');
    }
  }
}

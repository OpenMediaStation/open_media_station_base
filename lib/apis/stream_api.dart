import 'dart:typed_data';

import 'package:open_media_station_base/apis/base_api.dart';
import 'package:open_media_station_base/helpers/preferences.dart';
import 'package:open_media_station_base/helpers/http_wrapper.dart' as http;

class StreamApi {
  static Future<Uint8List?> downloadBytes(
    String category,
    String inventoryItemId,
  ) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/stream/$category/$inventoryItemId";

    var headers = await BaseApi.getRefreshedHeaders();

    var response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }
}

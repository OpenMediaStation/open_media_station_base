import 'package:open_media_station_base/apis/base_api.dart';
import 'package:open_media_station_base/helpers/preferences.dart';
import 'package:open_media_station_base/helpers/http_wrapper.dart'as http;
import 'package:open_media_station_base/models/inventory/inventory_item_addon.dart';

class SubtitleApi {
  Future<String> getSubtitle(
      InventoryItemAddon addon, String category, String inventoryItemId) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/addon/download?";

    var headers = await BaseApi.getRefreshedHeaders();

    var response = await http.get(
        Uri.parse(
            "${apiUrl}inventoryItemId=$inventoryItemId&category=$category&addonId=${addon.id}"),
        headers: headers);

    if (response.statusCode == 200) {
      var body = response.body;
      return body;
    } else {
      throw Exception('Failed to load subtitle');
    }
  }
}

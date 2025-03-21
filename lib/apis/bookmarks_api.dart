import 'dart:convert';

import 'package:open_media_station_base/apis/base_api.dart';
import 'package:open_media_station_base/helpers/preferences.dart';
import 'package:open_media_station_base/helpers/http_wrapper.dart' as http;
import 'package:open_media_station_base/models/bookmark.dart';

class BookmarksApi {
  static Future<bool> addBookmark(
      String category, String inventoryItemId, Bookmark bookmark) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/bookmark/$inventoryItemId?category=$category";

    var headers = await BaseApi.getRefreshedHeaders();
    headers["Content-Type"] = "application/json";
    var body = json.encode(bookmark.toJson());

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    return response.statusCode == 200;
  }

  static Future<bool> removeBookmark(
      String bookmarkId, String inventoryItemId, String category) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/bookmark/$inventoryItemId/$bookmarkId?category=$category";

    var headers = await BaseApi.getRefreshedHeaders();
    var response = await http.delete(Uri.parse(apiUrl), headers: headers);

    return response.statusCode == 200;
  }

  static Future<bool> updateBookmark(String bookmarkId, Bookmark bookmark,
      String inventoryItemId, String category) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/bookmark/$inventoryItemId/$bookmarkId?category=$category";

    var headers = await BaseApi.getRefreshedHeaders();
    headers["Content-Type"] = "application/json";

    var body = json.encode(bookmark.toJson());

    var response = await http.put(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    return response.statusCode == 200;
  }

  static Future<List<Bookmark>?> listBookmarks(
      String category, String inventoryItemId) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/bookmark/$inventoryItemId/category/$category";

    var headers = await BaseApi.getRefreshedHeaders();
    var response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((fileInfoJson) => Bookmark.fromJson(fileInfoJson))
          .toList();
    } else {
      return null;
    }
  }

  static Future<Bookmark?> getBookmark(
      String bookmarkId, String inventoryItemId, String category) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/bookmark/$inventoryItemId/$bookmarkId?category=$category";

    var headers = await BaseApi.getRefreshedHeaders();
    var response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}

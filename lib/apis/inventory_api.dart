import 'dart:convert';
import 'package:open_media_station_base/apis/base_api.dart';
import 'package:open_media_station_base/helpers/preferences.dart';
import 'package:open_media_station_base/models/inventory/audiobook.dart';
import 'package:open_media_station_base/models/inventory/book.dart';
import 'package:open_media_station_base/models/inventory/episode.dart';
import 'package:open_media_station_base/models/inventory/inventory_item.dart';
import 'package:open_media_station_base/helpers/http_wrapper.dart'as http;
import 'package:open_media_station_base/models/inventory/movie.dart';
import 'package:open_media_station_base/models/inventory/season.dart';
import 'package:open_media_station_base/models/inventory/show.dart';

class InventoryApi {
  Future<List<InventoryItem>> listItems(String category) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/inventory/items?";

    var headers = await BaseApi.getRefreshedHeaders();

    var response = await http.get(Uri.parse("${apiUrl}category=$category"),
        headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => InventoryItem.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<Movie> getMovie(String id) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/inventory/movie?";

    var headers = await BaseApi.getRefreshedHeaders();

    var response =
        await http.get(Uri.parse("${apiUrl}id=$id"), headers: headers);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      return Movie.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<Audiobook> getAudiobook(String id) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/inventory/audiobook?";

    var headers = await BaseApi.getRefreshedHeaders();

    var response =
        await http.get(Uri.parse("${apiUrl}id=$id"), headers: headers);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      return Audiobook.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load audiobook');
    }
  }

  Future<Book> getBook(String id) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/inventory/book?";

    var headers = await BaseApi.getRefreshedHeaders();

    var response =
        await http.get(Uri.parse("${apiUrl}id=$id"), headers: headers);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      return Book.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load book');
    }
  }

  Future<Show> getShow(String id) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/inventory/show?";

    var headers = await BaseApi.getRefreshedHeaders();

    var response =
        await http.get(Uri.parse("${apiUrl}id=$id"), headers: headers);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      return Show.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load show');
    }
  }

  Future<Season> getSeason(String id) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/inventory/season?";

    var headers = await BaseApi.getRefreshedHeaders();

    var response =
        await http.get(Uri.parse("${apiUrl}id=$id"), headers: headers);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      return Season.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load season');
    }
  }

  Future<Episode> getEpisode(String id) async {
    String apiUrl =
        "${Preferences.prefs?.getString("BaseUrl")}/api/inventory/episode?";

    var headers = await BaseApi.getRefreshedHeaders();

    var response =
        await http.get(Uri.parse("${apiUrl}id=$id"), headers: headers);

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      return Episode.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load episode');
    }
  }

  Future<List<Episode>> getEpisodes(List<String> ids) async {
    String baseUrl = Preferences.prefs?.getString("BaseUrl") ?? "";
    String apiUrl = "$baseUrl/api/inventory/episode/batch";

    var headers = await BaseApi.getRefreshedHeaders();

    Uri uri = Uri.parse(apiUrl).replace(
      queryParameters: {
        "ids": ids,
      },
    );

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      var result = jsonResponse.map((e) => Episode.fromJson(e)).toList();

      return result;
    } else {
      throw Exception('Failed to load episodes: ${response.body}');
    }
  }

  static Future<List<Show>> getShows(List<String> ids) async {
    String baseUrl = Preferences.prefs?.getString("BaseUrl") ?? "";
    String apiUrl = "$baseUrl/api/inventory/show/batch";

    var headers = await BaseApi.getRefreshedHeaders();

    Uri uri = Uri.parse(apiUrl).replace(
      queryParameters: {
        "ids": ids,
      },
    );

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => Show.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load shows: ${response.body}');
    }
  }

  static Future<List<Season>> getSeasons(List<String> ids) async {
    String baseUrl = Preferences.prefs?.getString("BaseUrl") ?? "";
    String apiUrl = "$baseUrl/api/inventory/season/batch";

    var headers = await BaseApi.getRefreshedHeaders();

    Uri uri = Uri.parse(apiUrl).replace(
      queryParameters: {
        "ids": ids,
      },
    );

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => Season.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load seasons: ${response.body}');
    }
  }
}

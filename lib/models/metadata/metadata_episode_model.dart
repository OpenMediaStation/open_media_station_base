import 'package:open_media_station_base/models/metadata/rating.dart';

class MetadataEpisodeModel {
  final String? year;
  final String? rated;
  final String? released;
  final String? runtime;
  final String? genre;
  final String? director;
  final String? writer;
  final String? actors;
  final String? plot;
  final String? language;
  final String? country;
  final String? awards;
  final String? backdrop;
  final String? backdropBlurHash;
  final List<Rating>? ratings;
  final String? metascore;
  final String? imdbRating;
  final String? imdbVotes;
  final String? imdbID;
  final String? type;
  final String? dvd;
  final String? boxOffice;
  final String? production;
  final String? website;

  MetadataEpisodeModel({
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.backdrop,
    this.backdropBlurHash,
    required this.ratings,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
  });

  factory MetadataEpisodeModel.fromJson(Map<String, dynamic> json) {
    var ratingsList = json['ratings'] as List?;
    List<Rating>? ratings =
        ratingsList?.map((ratingJson) => Rating.fromJson(ratingJson)).toList();

    var backdrop = (json['backdrop'] as String?);

    if (backdrop == "N/A") {
      backdrop = null;
    }

    return MetadataEpisodeModel(
      year: json['year'] as String?,
      rated: json['rated'] as String?,
      released: json['released'] as String?,
      runtime: json['runtime'] as String?,
      genre: json['genre'] as String?,
      director: json['director'] as String?,
      writer: json['writer'] as String?,
      actors: json['actors'] as String?,
      plot: json['plot'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
      awards: json['awards'] as String?,
      backdrop: backdrop,
      backdropBlurHash: json.containsKey('backdropBlurHash') ? json['backdropBlurHash'] as String? : null,
      ratings: ratings,
      metascore: json['metascore'] as String?,
      imdbRating: json['imdbRating'] as String?,
      imdbVotes: json['imdbVotes'] as String?,
      imdbID: json['imdbID'] as String?,
      type: json['type'] as String?,
      dvd: json['dvd'] as String?,
      boxOffice: json['boxOffice'] as String?,
      production: json['production'] as String?,
      website: json['website'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'rated': rated,
      'released': released,
      'runtime': runtime,
      'genre': genre,
      'director': director,
      'writer': writer,
      'actors': actors,
      'plot': plot,
      'language': language,
      'country': country,
      'awards': awards,
      'backdrop': backdrop,
      'backdropBlurHash': backdropBlurHash,
      'ratings': ratings?.map((rating) => rating.toJson()).toList(),
      'metascore': metascore,
      'imdbRating': imdbRating,
      'imdbVotes': imdbVotes,
      'imdbID': imdbID,
      'type': type,
      'dvd': dvd,
      'boxOffice': boxOffice,
      'production': production,
      'website': website,
    };
  }
}

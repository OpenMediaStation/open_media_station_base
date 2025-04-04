class MetadataSeasonModel {
  final String? poster;
  final String? posterBlurHash;
  final String? airDate;
  final int? episodeCount;
  final String? overview;

  MetadataSeasonModel({
    required this.poster,
    this.posterBlurHash,
    required this.airDate,
    required this.episodeCount,
    required this.overview,
  });

  factory MetadataSeasonModel.fromJson(Map<String, dynamic> json) {
    var overview = json['overview'] as String?;
    if (overview == "") {
      overview = null;
    }

    return MetadataSeasonModel(
      poster: json['poster'] as String?,
      posterBlurHash: json.containsKey('posterBlurHash') ? json['posterBlurHash'] as String? : null,
      airDate: json['airDate'] as String?,
      episodeCount: json['episodeCount'] as int?,
      overview: overview,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'poster': poster,
      'posterBlurHash': posterBlurHash,
      'airDate': airDate,
      'episodeCount': episodeCount,
      'overview': overview,
    };
  }
}

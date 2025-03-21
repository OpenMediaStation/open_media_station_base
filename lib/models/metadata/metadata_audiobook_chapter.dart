class MetadataAudiobookChapter {
  final String? title;
  final int? startTimeInSeconds;
  final int? endTimeInSeconds;

  MetadataAudiobookChapter({
    this.title,
    this.startTimeInSeconds,
    this.endTimeInSeconds,
  });

  factory MetadataAudiobookChapter.fromJson(Map<String, dynamic> json) {
    return MetadataAudiobookChapter(
      title: json['title'] as String?,
      startTimeInSeconds: json['startTimeInSeconds'] as int?,
      endTimeInSeconds: json['endTimeInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'startTimeInSeconds': startTimeInSeconds,
      'endTimeInSeconds': endTimeInSeconds,
    };
  }
}

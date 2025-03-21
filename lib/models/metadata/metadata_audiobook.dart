import 'package:open_media_station_base/models/metadata/metadata_audiobook_chapter.dart';

class MetadataAudiobookModel {
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final String? language;
  final String? thumbnail;
  final List<MetadataAudiobookChapter>? chapters;

  MetadataAudiobookModel({
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.language,
    this.thumbnail,
    this.chapters,
  });

  // Factory method to create MetadataBookModel from JSON
  factory MetadataAudiobookModel.fromJson(Map<String, dynamic> json) {
    return MetadataAudiobookModel(
      authors: (json['authors'] as List<dynamic>?)
          ?.map((author) => author as String)
          .toList(),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((chapter) => MetadataAudiobookChapter.fromJson(chapter))
          .toList(),
      publisher: json['publisher'] as String?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      language: json['language'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );
  }

  // Method to convert MetadataBookModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'language': language,
      'thumbnail': thumbnail,
      'chapters': chapters,
    };
  }
}

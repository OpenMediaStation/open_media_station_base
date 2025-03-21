class Bookmark {
  String? id;
  int? positionInSeconds;
  String? title;
  String? description;
  int? pageNumber;

  Bookmark({
    this.id,
    this.positionInSeconds,
    this.title,
    this.description,
    this.pageNumber,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      id: json['id'] as String?,
      positionInSeconds: json['positionInSeconds'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      pageNumber: json['pageNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'positionInSeconds': positionInSeconds,
      'title': title,
      'description': description,
      'pageNumber': pageNumber,
    };
  }
}

class InventoryItemPart {
  final String id;
  final String path;
  final String? fileInfoId;
  final String? name;
  final int? primaryIdentifier;
  final int? secondaryIdentifier;

  InventoryItemPart({
    required this.id,
    required this.path,
    this.fileInfoId,
    this.name,
    this.primaryIdentifier,
    this.secondaryIdentifier
  });

  factory InventoryItemPart.fromJson(Map<String, dynamic> json) {
    return InventoryItemPart(
      id: json['id'] as String,
      path: json['path'] as String,
      fileInfoId: json['fileInfoId'] as String?,
      name: json['name'] as String?,
      primaryIdentifier: json['primaryIdentifier'] as int?,
      secondaryIdentifier: json['secondaryIdentifier'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'fileInfoId': fileInfoId,
      'name': name,
      'primaryIdentifier': primaryIdentifier,
      'secondaryIdentifier': secondaryIdentifier,
    };
  }
}

import 'package:open_media_station_base/models/inventory/inventory_item_part.dart';

class InventoryItemVersion {
  final String id;
  final String path;
  final String? fileInfoId;
  final String? name;
  final List<InventoryItemPart>? parts;

  InventoryItemVersion({
    required this.id,
    required this.path,
    this.fileInfoId,
    this.name,
    this.parts,
  });

  factory InventoryItemVersion.fromJson(Map<String, dynamic> json) {
    return InventoryItemVersion(
      id: json['id'] as String,
      path: json['path'] as String,
      fileInfoId: json['fileInfoId'] as String?,
      name: json['name'] as String?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((part) => InventoryItemPart.fromJson(part))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'fileInfoId': fileInfoId,
      'name': name,
      'parts': parts?.map((part) => part.toJson()).toList(),
    };
  }
}

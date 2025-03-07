import 'package:open_media_station_base/models/inventory/inventory_item.dart';
import 'package:open_media_station_base/models/inventory/inventory_item_addon.dart';
import 'package:open_media_station_base/models/inventory/inventory_item_version.dart';

class Audiobook extends InventoryItem {
  Audiobook(
      {required super.id,
      required super.title,
      required super.category,
      required super.metadataId,
      required super.folderPath,
      required super.versions,
      required super.addons});

  factory Audiobook.fromJson(Map<String, dynamic> json) {
    return Audiobook(
      id: json['id'] as String,
      title: json['title'] as String?,
      category: json['category'] as String,
      metadataId: json['metadataId'] as String?,
      folderPath: json['folderPath'] as String?,
      versions: (json['versions'] as List<dynamic>?)
          ?.map((version) =>
              InventoryItemVersion.fromJson(version as Map<String, dynamic>))
          .toList(),
      addons: (json['addons'] as List<dynamic>?)
          ?.map((addon) =>
              InventoryItemAddon.fromJson(addon as Map<String, dynamic>))
          .toList(),
    );
  }

}

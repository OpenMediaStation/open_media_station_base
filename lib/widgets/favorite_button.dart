import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:open_media_station_base/open_media_station_base.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.inventoryItem,
    this.isFavorite,
  });

  final InventoryItem? inventoryItem;
  final bool? isFavorite;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    isFavorite ??= widget.isFavorite;

    FavoritesApi favoritesApi = FavoritesApi();

    return IconButton(
      onPressed: () async {
        if (widget.inventoryItem == null) {
          return;
        }

        bool success = false;

        if (isFavorite ?? false) {
          success = await favoritesApi.unfavorite(
            widget.inventoryItem!.category,
            widget.inventoryItem!.id,
          );
        } else {
          success = await favoritesApi.favorite(
            widget.inventoryItem!.category,
            widget.inventoryItem!.id,
          );
        }

        if (success == true) {
          setState(() {
            isFavorite = !(isFavorite ?? false);
          });
        }
      },
      icon: Icon(
        isFavorite ?? false
            ? AntDesign.heart_fill
            : AntDesign.heart_outline,
        color: isFavorite ?? false ? Colors.red : null,
      ),
    );
  }
}

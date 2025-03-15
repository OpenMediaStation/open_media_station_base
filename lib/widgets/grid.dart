import 'package:flutter/material.dart';
import 'package:open_media_station_base/models/internal/grid_item_model.dart';
import 'package:open_media_station_base/models/inventory/inventory_item.dart';
import 'package:open_media_station_base/widgets/grid_item.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
    required this.inventoryItems,
    required this.scrollController,
    required this.desiredItemWidth,
    required this.crossAxisCount,
    required this.gridMainAxisSpacing,
    required this.gridCrossAxisSpacing,
    required this.gridItemAspectRatio,
    required this.getGridItemModel,
    required this.pictureNotFoundUrl,
    required this.onGridItemTap,
  });

  final Future<GridItemModel> Function(InventoryItem) getGridItemModel;
  final void Function(BuildContext, InventoryItem, GridItemModel)
      onGridItemTap;

  final List<InventoryItem> inventoryItems;
  final ScrollController scrollController;

  final double desiredItemWidth;
  final int crossAxisCount;
  final double gridMainAxisSpacing;
  final double gridCrossAxisSpacing;
  final double gridItemAspectRatio;

  final String pictureNotFoundUrl;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      itemCount: inventoryItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: gridCrossAxisSpacing,
        mainAxisSpacing: gridMainAxisSpacing,
        childAspectRatio: gridItemAspectRatio,
      ),
      itemBuilder: (context, index) {
        return FutureBuilder<GridItemModel>(
          future: getGridItemModel(inventoryItems[index]),
          builder: (context, snapshot) {
            GridItemModel gridItem;

            if (snapshot.connectionState == ConnectionState.waiting) {
              gridItem = GridItemModel(
                inventoryItem: inventoryItems[index],
                metadataModel: null,
                isFavorite: null,
                progress: null,
              );

              gridItem.fake = true;
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('Grid item could not be loaded'));
            } else {
              gridItem = snapshot.data!;
            }

            return InkWell(
              child: GridItem(
                item: gridItem,
                desiredItemWidth: desiredItemWidth,
                pictureNotFoundUrl: pictureNotFoundUrl,
              ),
              onTap: () {
                onGridItemTap(
                  context,
                  inventoryItems[index],
                  gridItem,
                );
              },
            );
          },
        );
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:open_media_station_base/apis/base_api.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    required this.pictureNotFoundUrl,
    this.blurHash,
    this.fit,
    this.width,
    this.height,
    this.alignment,
    this.fake = false,
    this.disableAdaptiveImage = false,
  });

  final String? blurHash;
  final String? imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final bool disableAdaptiveImage;
  final bool fake;
  final Alignment? alignment;
  final String pictureNotFoundUrl;

  @override
  Widget build(BuildContext context) {
    String addon = "";

    if (width?.isFinite ?? false) {
      addon = "?width=${width?.floor()}";
    }

    String? imageUrlFinal = imageUrl;

    if (!fake && imageUrlFinal == null) {
      imageUrlFinal = pictureNotFoundUrl;
    }

    Widget placeholder = SizedBox(
      width: width,
      height: height,
    );

    if(blurHash != null){
      placeholder = BlurHash(hash: blurHash!);
    }

    if (imageUrlFinal == null) {
      return placeholder;
    }

    return CachedNetworkImage(
      imageUrl: "$imageUrlFinal$addon",
      fit: fit,
      width: width,
      height: height,
      alignment: alignment ?? Alignment.center,
      httpHeaders: BaseApi.getHeaders(),
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) {
        return CustomImage(
          imageUrl: pictureNotFoundUrl,
          width: width,
          height: height,
          fit: fit,
          disableAdaptiveImage: disableAdaptiveImage,
          pictureNotFoundUrl: pictureNotFoundUrl,
        );
      },
    );
  }
}

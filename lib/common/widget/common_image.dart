import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;

  CommonImage({
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('http') || imageUrl.startsWith('https')) {
      if (imageUrl.endsWith('.svg')) {
        return SvgPicture.network(
          imageUrl,
          height: height,
          width: width,
          fit: fit,
        );
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: height,
          width: width,
          fit: fit,
        );
      }
    } else if (imageUrl.endsWith('.svg')) {
      return SvgPicture.asset(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.asset(
        imageUrl,
        fit: fit,
        height: height,
        width: width,
      );
    }
  }
}

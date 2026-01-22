import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../shimmers/shimmer.dart';

class YRoundedImage extends StatelessWidget {
  const YRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.backgroundColor,
    this.borderRadius = YSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    // Auto-detect network images by checking if URL starts with http:// or https://
    final bool isNetwork =
        isNetworkImage ||
        imageUrl.startsWith('http://') ||
        imageUrl.startsWith('https://');

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetwork
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  width: width,
                  height: height,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      YShimmerEffect(
                        width: width ?? double.infinity,
                        height: height ?? 158,
                      ),
                )
              : Image(
                  image: AssetImage(imageUrl),
                  fit: fit,
                  width: width,
                  height: height,
                ),
        ),
      ),
    );
  }
}

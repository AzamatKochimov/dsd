import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String? imageUrl;
  final EdgeInsetsGeometry? margin;
  final BorderRadius borderRadius;
  final GestureTapCallback? onTap;
  final BoxFit? fit;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final bool enabledZoom;

  const CustomImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.margin,
    this.borderRadius = BorderRadius.zero,
    this.onTap,
    this.fit,
    this.color,
    this.boxShadow,
    this.enabledZoom = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: InteractiveViewer(
          scaleEnabled: enabledZoom,
          child: Container(
            width: width,
            height: height,
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              boxShadow: boxShadow,
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Builder(
                builder: (context) {
                  if ((imageUrl ?? '').isEmpty) {
                    return Container(
                      width: width,
                      height: height,
                      margin: margin,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: borderRadius,
                      ),
                    );
                  }
                  if (imageUrl!.contains('http')) {
                    return CachedNetworkImage(
                      imageUrl: imageUrl!,
                      width: width,
                      height: height,
                      fit: fit ?? BoxFit.fill,
                      color: color,
                      progressIndicatorBuilder: (context, url, progress) => Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.8),
                        highlightColor: Colors.grey.withOpacity(0.2),
                        child: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: borderRadius,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, dynamic error) => Container(
                        width: width,
                        height: height,
                        margin: margin,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: borderRadius,
                        ),
                      ),
                    );
                  }
                  return Container(
                    width: width,
                    height: height,
                    margin: margin,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: borderRadius,
                      image: DecorationImage(
                        image: AssetImage(imageUrl!),
                        fit: fit ?? BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';

import './loading_shimmer_default.dart';

class ImageDefault extends StatelessWidget {
  const ImageDefault({
    Key? key,
    required this.url,
    this.height = 120,
    this.radius = 5,
    this.fit = BoxFit.cover,
    this.alignment,
  }) : super(key: key);

  final String url;
  final double height;
  final double radius;
  final BoxFit fit;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    String pathDefaultImage = "assets/images/default_image.jpg";

    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(radius), child: LoadingShimmerDefault(height: height)),
          ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: url.isEmpty
                ? hasNoImage(pathDefaultImage)
                : Image.network(
                    url,
                    fit: fit,
                    height: height,
                    alignment: alignment ?? Alignment.center,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
                        loadingProgress == null ? child : const LoadingShimmerDefault(),
                    errorBuilder: (context, error, stackTrace) => hasNoImage(pathDefaultImage),
                  ),
          ),
        ],
      ),
    );
  }

  Image hasNoImage(String pathDefaultImage) {
    return Image.asset(
      pathDefaultImage,
      fit: fit,
      height: height,
      alignment: alignment ?? Alignment.center,
    );
  }
}

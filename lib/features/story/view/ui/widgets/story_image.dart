import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/misc/shimmer.dart';

class StoryImage extends StatelessWidget {
  final String imageUrl;
  final void Function()? onLoadingComplete;

  const StoryImage({super.key, required this.imageUrl, this.onLoadingComplete});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        onLoadingComplete?.call();
        return Image(
          image: imageProvider,
          fit: BoxFit.fitWidth,
        );
      },
      placeholder: (context, url) {
        return const Shimmer(
          child: SizedBox.expand(),
        );
      },
      errorWidget: (context, url, error) {
        return const Center(
          child: Icon(Icons.error),
        );
      },
    );
  }
}

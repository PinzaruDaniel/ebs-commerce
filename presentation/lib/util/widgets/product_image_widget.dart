import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/util/resources/app_icons.dart';

import 'circular_progress_indicator_widget.dart';

class ProductImageWidget extends StatelessWidget {
  final double height;
  final String? imageUrl;
  final double? width;
  const ProductImageWidget({super.key, required this.height, this.imageUrl, required this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (imageUrl?.isNotEmpty ?? false) ? imageUrl! : AppIcons.noImage,
      progressIndicatorBuilder: (context, url, downloadProgress) =>

          CircularProgressIndicatorWidget(boxConstraints: BoxConstraints(minWidth: 40, minHeight: 40,),
              value: downloadProgress.progress),
      errorWidget: (context, url, error) =>
          Image.asset(AppIcons.noImage, height: height, width: width, fit: BoxFit.cover),

      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}

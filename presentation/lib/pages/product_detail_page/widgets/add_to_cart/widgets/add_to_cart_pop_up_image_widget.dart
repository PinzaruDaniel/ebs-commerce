import 'package:flutter/material.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../../../../themes/app_colors.dart';

class AddToCartPopUpImageWidget extends StatelessWidget {
  const AddToCartPopUpImageWidget({super.key, required this.item});
  final ProductViewModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image(
            image: item.imageUrl!.isNotEmpty
                ? NetworkImage(item.imageUrl![0])
                : AssetImage('assets/products/noimage.png') as ImageProvider,

            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                heightFactor: 4,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

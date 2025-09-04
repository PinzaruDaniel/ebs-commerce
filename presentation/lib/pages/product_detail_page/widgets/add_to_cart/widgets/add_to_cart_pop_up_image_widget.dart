import 'package:flutter/material.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../../../../util/widgets/product_image_widget.dart';

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
          child: ProductImageWidget(height: 100, width: 100, imageUrl:  item.imageUrl != null && item.imageUrl!.isNotEmpty ? item
              .imageUrl![0] : null,)
        ),
      ],
    );
  }
}

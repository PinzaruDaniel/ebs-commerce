import 'package:flutter/material.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../../../../util/resources/app_images.dart';
import '../../../../../util/widgets/circular_progress_indicator_page_widget.dart';

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
                : AssetImage(AppImages.noImage) as ImageProvider,

            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return  CircularProgressIndicatorPageWidget(
                boxConstraints: BoxConstraints(minWidth:40, minHeight: 40),
                heightFactor: 2.5,
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

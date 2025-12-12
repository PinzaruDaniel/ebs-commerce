import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/open_container_animation_widget.dart';
import 'package:presentation/util/widgets/product_image_widget.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../product_detail_page/product_detail_page.dart';

class HomeProductsItemWidget extends StatefulWidget {
  const HomeProductsItemWidget({super.key, required this.item, this.width, this.height});

  final ProductViewModel item;
  final double? width;
  final double? height;

  @override
  State<HomeProductsItemWidget> createState() => _HomeProductsItemWidgetState();
}

class _HomeProductsItemWidgetState extends State<HomeProductsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: widget.width,
        child: OpenContainerAnimation(
          closedBuilder: (context, openContainer) {
            return productDetails(item: widget.item, openContainer: openContainer);
          },
          openBuilder: (context, closeContainer) {
            return ProductDetailPage(item: widget.item);
          },
        ),
      ),
    );
  }

  Widget productDetails({required ProductViewModel item, required Function() openContainer}) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: openContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: ProductImageWidget(
              height: widget.height ?? 150,
              width: double.infinity,
              imageUrl: item.imageUrl != null && item.imageUrl!.isNotEmpty ? item.imageUrl![0] : null,
            ),
          ),
          const SizedBox(height: 4),
          Text(item.title, style: AppTextsStyle.medium, overflow: TextOverflow.ellipsis, maxLines: 1),
          Text(item.company?[AppTexts.brand] as String? ?? '', style: AppTextsStyle.medium),
          Text('\$ ${item.price ?? '-'}', style: AppTextsStyle.bold()),
        ],
      ),
    );
  }
}

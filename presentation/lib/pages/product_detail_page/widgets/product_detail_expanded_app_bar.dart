import 'package:carousel_slider/carousel_slider.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../themes/app_colors.dart';

class ProductDetailExpandedAppBar extends StatefulWidget {
  const ProductDetailExpandedAppBar({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailExpandedAppBar> createState() => _ProductDetailExpandedAppBarState();
}

class _ProductDetailExpandedAppBarState extends State<ProductDetailExpandedAppBar> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.item.imageUrl?.length ?? 1,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            final image = widget.item.imageUrl?[itemIndex];
            return Image(
              image: image!.isNotEmpty ?
                  NetworkImage(image): AssetImage('assets/products/noimage.png') as ImageProvider,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  heightFactor: 4,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: false,
            viewportFraction: 1,
            height: 400,
            onPageChanged: (index, reason) => setState(() => activeIndex = index),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: widget.item.imageUrl!.isNotEmpty ? AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.item.imageUrl?.length ?? 0,
              effect: WormEffect(
                type: WormType.thin,
                dotHeight: 8,
                dotWidth: 8,
                dotColor: widget.item.imageUrl?.length != null ? AppColors.primary : Colors.transparent,
                paintStyle: PaintingStyle.stroke,
                activeDotColor: widget.item.imageUrl?.length != null ? AppColors.primary : Colors.transparent,
              ),
            ): SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

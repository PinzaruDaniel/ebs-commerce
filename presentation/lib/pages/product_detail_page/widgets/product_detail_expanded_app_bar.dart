import 'package:carousel_slider/carousel_slider.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../util/resources/app_colors.dart';
import '../../../util/widgets/product_image_widget.dart';

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
          itemCount: (widget.item.imageUrl != null && widget.item.imageUrl!.isNotEmpty)
              ? widget.item.imageUrl!.length
              : 1,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            return ProductImageWidget(
              height: 400,
              width: double.infinity,
              imageUrl:  widget.item.imageUrl != null && widget.item.imageUrl!.isNotEmpty ? widget.item
                  .imageUrl![itemIndex] : null,
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
            child: widget.item.imageUrl!.isNotEmpty
                ? AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: widget.item.imageUrl?.length ?? 1,
                    effect: WormEffect(
                      type: WormType.thin,
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: widget.item.imageUrl?.length== 1 ? Colors.transparent : AppColors.primary,
                      paintStyle: PaintingStyle.stroke,
                      activeDotColor: widget.item.imageUrl?.length == 1 ? Colors.transparent : AppColors.primary,
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

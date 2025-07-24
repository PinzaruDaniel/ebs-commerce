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

  //final CarouselController _controller=CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.item.imageUrl?.length ?? 1,
          //carouselController: _controller,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            final image = widget.item.imageUrl?[itemIndex];
            return Image.asset(
              image ?? 'assets/products/headphones.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            height: 400,
            onPageChanged: (index, reason) => setState(() => activeIndex = index),
          ),
        ),
        Align(
         // heightFactor: 38,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:  EdgeInsets.only(bottom: 24),
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.item.imageUrl?.length?? 1,
              effect: WormEffect(
                type: WormType.thin,
                dotHeight: 8,
                dotWidth: 8,
                dotColor: AppColors.primary,
                paintStyle: PaintingStyle.stroke,
                activeDotColor: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 80,
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20,)),
            actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/Cart icon.svg'))],
          ),*/

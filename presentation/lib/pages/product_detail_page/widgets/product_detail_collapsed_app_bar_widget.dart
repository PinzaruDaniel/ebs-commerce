
import 'package:presentation/themes/app_text_styles.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailCollapsedAppBarWidget extends StatefulWidget {
  const ProductDetailCollapsedAppBarWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailCollapsedAppBarWidget> createState() => _ProductDetailCollapsedAppBarWidgetState();
}

class _ProductDetailCollapsedAppBarWidgetState extends State<ProductDetailCollapsedAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.item.title, style: AppTextsStyle.bold),

      ],
    );

    /*Stack(
      children: [
        Align(
          heightFactor: 1,
          child: CarouselSlider.builder(
            itemCount: widget.item.imageUrl.length,
            options: CarouselOptions(viewportFraction: 1, height: 300),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              final images = widget.item.imageUrl[itemIndex];
              return SizedBox( width: double.infinity, child: Image.asset(images, fit: BoxFit.cover));
            },
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20,)),
          actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/Cart icon.svg'))],
        ),
      ],
    );*/
  }
}

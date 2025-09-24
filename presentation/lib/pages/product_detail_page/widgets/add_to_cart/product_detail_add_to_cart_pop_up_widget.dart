import 'package:get/get.dart';
import 'package:presentation/pages/product_detail_page/widgets/add_to_cart/widgets/add_to_cart_pop_up_image_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/add_to_cart/widgets/add_to_cart_pop_up_title_widget.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/product_input_quantity_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../util/widgets/header_title_widget.dart';

class ProductDetailAddToCartBottomSheetWidget extends StatefulWidget {
  const ProductDetailAddToCartBottomSheetWidget({
    super.key,
    required this.item,
    required this.onAdd,
    required this.maxValue,
  });

  final ProductViewModel item;
  final Function onAdd;
  final int? maxValue;

  @override
  State<ProductDetailAddToCartBottomSheetWidget> createState() => _ProductDetailAddToCartBottomSheetWidgetState();
}

class _ProductDetailAddToCartBottomSheetWidgetState extends State<ProductDetailAddToCartBottomSheetWidget> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AddToCartPopUpImageWidget(item: widget.item),
              AddToCartPopUpTitleWidget(item: widget.item),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderTitleWidget(itemViewModel: HeaderTitleViewModel(title: AppTexts.quantity, showDivider: false)),
              SizedBox(height: 12),
              ProductInputQuantityWidget(
                initialValue: 1,
                onChanged: (val) {
                  quantity = val;
                },
                maxValue: widget.maxValue,
              ),
            ],
          ),
        ),
        BottomNavigationBarWidget(
          title: AppTexts.addToCart,
          addToCart: true,
          onTap: () {
            Get.back();

            widget.onAdd.call(quantity);

          },
          showIcon: true,
        ),
      ],
    );
  }
}

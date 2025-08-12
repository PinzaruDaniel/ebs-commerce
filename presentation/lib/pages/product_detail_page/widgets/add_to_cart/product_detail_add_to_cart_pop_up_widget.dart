import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/product_detail_page/widgets/add_to_cart/add_to_cart_controller.dart';
import 'package:presentation/pages/product_detail_page/widgets/add_to_cart/widgets/add_to_cart_pop_up_image_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/add_to_cart/widgets/add_to_cart_pop_up_title_widget.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/util/widgets/product_input_quantity_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../util/routing/app_router.dart';
import '../../../../util/widgets/header_title_widget.dart';
import 'package:get/get.dart';

class ProductDetailAddToCartBottomSheetWidget extends StatefulWidget {
  const ProductDetailAddToCartBottomSheetWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailAddToCartBottomSheetWidget> createState() => _ProductDetailAddToCartBottomSheetWidgetState();
}

class _ProductDetailAddToCartBottomSheetWidgetState extends State<ProductDetailAddToCartBottomSheetWidget> {
  AddToCartController get addCartController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(AddToCartController());
    addCartController.initCartItem(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: EdgeInsets.only(top: 30, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderTitleWidget(itemViewModel: HeaderTitleViewModel(title: AppTexts.quantity, showDivider: false),),
              SizedBox(height: 12),
              ProductInputQuantityWidget(
                initialValue: 1,
                onChanged: (val) {
                  addCartController.cartItem.value?.quantity = val;
                  addCartController.cartItem.refresh();
                },
                maxValue: addCartController.cartItem.value?.stock,
              ),
            ],
          ),
        ),
        Spacer(),
        BottomNavigationBarWidget(
          item: widget.item,
          title: AppTexts.addToCart,
          addToCart: true,
          router: () {
            final item=addCartController.cartItem.value;
            if(item !=null){
              mainAppController.addToCart(item);
              AppRouter.openShoppingCartPage();
            }
          },
          showIcon: true,
        ),
      ],
    );
  }
}

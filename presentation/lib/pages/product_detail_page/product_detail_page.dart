import 'package:common/constants/logger.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/product_detail_page/widgets/add_to_cart/add_to_cart_controller.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_back_icon_glass_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_collapsed_app_bar_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_expanded_app_bar.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_page_body_widget.dart';
import 'package:presentation/pages/shopping_cart_page/shopping_cart_page.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/util/widgets/app_bar_icon_shopping_cart_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_texts.dart';
import '../../util/routing/app_router.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.item});

  final ProductViewModel? item;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  ScrollController get scrollController => ScrollController();
  bool isCollapsed = false;

  AddToCartController get addCartController => Get.find();
  bool isItemInCart = false;
  int itemIndex = 0;

  @override
  void initState() {
    super.initState();
    Get.put(AddToCartController());
    _initData();
  }

  void _initData() {
    addCartController.initCartItem(widget.item!);
    isItemInCart = mainAppController.isItemInCart(addCartController.cartItem.value!);
    scrollController.addListener(_scrollListener);
    itemIndex = mainAppController.cartItems.indexWhere((element) => element.id == widget.item!.id);
    setState(() {});
  }

  void _scrollListener() {
    final collapsed = scrollController.hasClients && scrollController.offset > 200;
    if (collapsed != isCollapsed) {
      setState(() => isCollapsed = collapsed);
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isItemValid = widget.item?.price != null && widget.item?.stock != null;
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            collapsedHeight: 60,
            pinned: true,
            centerTitle: false,
            title: AnimatedOpacity(
              curve: Curves.easeIn,
              opacity: isCollapsed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: isCollapsed ? ProductDetailCollapsedAppBarWidget(item: widget.item!) : const SizedBox.shrink(),
            ),
            backgroundColor: isCollapsed ? Colors.white : Colors.transparent,
            surfaceTintColor: Colors.white,

            leading: ProductDetailBackIconGlassWidget(),
            actions: [AppBarIconShoppingCartWidget(showLiquid: true)],
            flexibleSpace: FlexibleSpaceBar(background: ProductDetailExpandedAppBar(item: widget.item!)),
          ),
          SliverToBoxAdapter(
            child: Material(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              elevation: 0,
              child: ProductDetailPageBodyWidget(item: widget.item!),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        buttonColor: isItemInCart
            ? AppColors.primary
            : isItemValid
            ? AppColors.primary
            : Colors.grey.shade300,
        textColor: isItemInCart
            ? Colors.white
            : isItemValid
            ? Colors.white
            : Colors.black,
        title: isItemInCart
            ? '${AppTexts.goToCart} (${mainAppController.cartItems.value[itemIndex].quantity}) '
            : isItemValid
            ? AppTexts.addToCart
            : AppTexts.cantAddToCart,
        showIcon: !isItemInCart && isItemValid,
        onTap: () {
          if (isItemInCart) {
            AppRouter.openShoppingCartPage(
              onGoBack: () {
                _initData();
              },
            );
          } else {
            AppPopUp.showCartInfoPopUp(
              item: widget.item!,
              onAdd: (int quantity) {
                addCartController.cartItem.value?.quantity = quantity;
                final item = addCartController.cartItem.value;
                mainAppController.addToCart(item!);
                AppRouter.openShoppingCartPage(
                  onGoBack: () {
                    _initData();
                  },
                );
              },
              maxValue: widget.item!.stock,
            );
          }
        },
      ),
    );
  }
}

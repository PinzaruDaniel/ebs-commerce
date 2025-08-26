import 'package:get/get.dart';
import 'package:presentation/pages/product_detail_page/widgets/add_to_cart/add_to_cart_controller.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_collapsed_app_bar_widget.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_expanded_app_bar.dart';
import 'package:presentation/pages/product_detail_page/widgets/product_detail_page_body_widget.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/util/widgets/app_bar_icon_shopping_cart_widget.dart';
import 'package:presentation/util/widgets/bottom_navigation_bar_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';
import '../../controllers/controller_imports.dart';
import '../../util/resources/app_colors.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_texts.dart';
import '../../util/routing/app_router.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.item});

  final ProductViewModel? item;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ScrollController scrollController;
  bool isCollapsed = false;

  //de scos controller
  AddToCartController get addCartController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(AddToCartController());
    addCartController.initCartItem(widget.item!);
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final collapsed = scrollController.hasClients && scrollController.offset > (300 - 140);
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
              curve: Curves.easeOut,
              opacity: isCollapsed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: isCollapsed ? ProductDetailCollapsedAppBarWidget(item: widget.item!) : const SizedBox.shrink(),
            ),
            backgroundColor: isCollapsed ? Colors.white : Colors.transparent,
            surfaceTintColor: Colors.white,

            leading: IconButton(
              icon: AppIcons.backIcon(color: AppColors.blue, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [AppBarIconShoppingCartWidget()],
            flexibleSpace: FlexibleSpaceBar(background: ProductDetailExpandedAppBar(item: widget.item!)),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Material(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                elevation: 0,
                child: ProductDetailPageBodyWidget(item: widget.item!),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBarWidget(
        addToCart: widget.item?.price != null && widget.item?.stock != null,
        title: widget.item?.price != null && widget.item?.stock != null ? AppTexts.addToCart : AppTexts.cantAddToCart,
        showIcon: widget.item?.price != null && widget.item?.stock != null,
        titleDialog: AppTexts.oops,
        contentDialog: AppTexts.cantAddToCart,
        onTap: () {
          AppPopUp.showCartInfoPopUp(
            item: widget.item!,
            onAdd: (int quantity) {
              addCartController.cartItem.value?.quantity = quantity;

              final item = addCartController.cartItem.value;

              if (item != null) {
                mainAppController.addToCart(item);
                AppRouter.openShoppingCartPage();
              }
            },
          );
        },
      ),
    );
  }
}

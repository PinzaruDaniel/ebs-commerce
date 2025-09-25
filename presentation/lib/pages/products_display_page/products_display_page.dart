import 'package:domain/modules/products/use_cases/get_filtered_products_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/home_controller.dart';
import 'package:presentation/pages/products_display_page/products_display_controller.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/widgets/app_bar_icon_shopping_cart_widget.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/smart_refresher_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../util/enum/enums.dart';
import '../../util/widgets/loading_overlay_widget.dart';

class ProductsDisplayPage extends StatefulWidget {
  final String title;
  final ProductListType type;
  final GetFilteredProductsParams? getFilteredProductsParams;

  const ProductsDisplayPage({super.key, required this.title, required this.type, this.getFilteredProductsParams, });

  @override
  State<ProductsDisplayPage> createState() => _ProductsDisplayPageState();
}

class _ProductsDisplayPageState extends State<ProductsDisplayPage> {
  HomeController get homeController => Get.find();

  ProductsDisplayController get controller => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(ProductsDisplayController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //TODO: to send filter params, request filtered products, displaiyng page
      controller.loadProducts(productType: widget.type, getFilteredProductsParams: widget.getFilteredProductsParams);
    });
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBorder: true,
        iconColors: AppColors.blue,
        title: widget.title,
        actions: [AppBarIconShoppingCartWidget()],
      ),
      body: SafeArea(
        child: Obx(
              () =>
              SmartRefresherWidget(
                controller: _refreshController,
                onRefresh: () async {
                  await controller.loadProducts(loadMore: false, productType: widget.type);
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  await controller.loadProducts(loadMore: true, productType: widget.type);
                  _refreshController.loadComplete();
                },
                //TODO: prin-trun container care
                child: controller.isLoading.value
                    ? LoadingOverlayWidget(isLoading: true)
                    : SingleChildScrollView(
                  child: ProductsListDisplayWidget(
                    title: widget.title,
                    showHeaderTitle: false,
                    products: controller.products,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
/*child: ProductsListContainer(
                      builder: (context, products) {
                        return ProductsListDisplayWidget(
                          title: widget.title,
                          showHeaderTitle: false,
                          products: products,
                        );
                      }
                    ),*/
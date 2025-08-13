import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/home_controller.dart';
import 'package:presentation/pages/products_display_page/products_display_controller.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../util/resources/app_icons.dart';
import '../../util/routing/app_router.dart';
import '../../util/widgets/circular_progress_indicator_page_widget.dart';

class ProductsDisplayPage extends StatefulWidget {
  final String title;
  final ProductListType type;

  const ProductsDisplayPage({super.key, required this.title, required this.type});

  @override
  State<ProductsDisplayPage> createState() => _ProductsDisplayPageState();
}

class _ProductsDisplayPageState extends State<ProductsDisplayPage> {
  HomeController get homeController => Get.find();

  ProductsDisplayController get controller => Get.find();

  @override
  void initState() {
    super.initState();
    Get.delete<ProductsDisplayController>();
    Get.put(ProductsDisplayController(widget.type));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadProducts();
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
        actions: [IconButton(onPressed: AppRouter.openShoppingCartPage, icon: AppIcons.cartIcon)],
      ),
      body: Obx(() {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              footer: ClassicFooter(
                loadingText: 'Loading more...',
                loadingIcon: CircularProgressIndicatorPageWidget(
                  boxConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
                ),
                canLoadingText: 'Release to load more',
                idleText: 'Pull up to load more',
                noDataText: 'No more data',
              ),
              header: WaterDropMaterialHeader(
                distance: 50,
                color: AppColors.primary,
                backgroundColor: Colors.grey.shade100,
              ),
              controller: _refreshController,
              onRefresh: () async {
                await controller.loadProducts(loadMore: false);
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                await controller.loadProducts(loadMore: true);
                _refreshController.loadComplete();
              },

              child: controller.isLoading.value
                  ? CircularProgressIndicatorPageWidget(boxConstraints: BoxConstraints(minHeight: 75, minWidth: 75))
                  : SingleChildScrollView(
                      child: ProductsListDisplayWidget(
                        title: widget.title,
                        showHeaderTitle: false,
                        products: controller.products,
                      ),
                    ),
            ),
          ),
        );
      }),
    );
  }
}

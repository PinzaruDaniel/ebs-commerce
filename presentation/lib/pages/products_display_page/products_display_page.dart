import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/products_display_page/products_display_controller.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/widgets/app_bar_icon_shopping_cart_widget.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/base/base_page.dart';
import 'package:presentation/util/widgets/smart_refresher_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../util/enum/enums.dart';

class ProductsDisplayPage extends StatefulWidget {
  final String title;
  final ProductListType type;
  final List<int>? selectedCategoryIds;
  final SfRangeValues? priceRange;

  const ProductsDisplayPage({
    super.key,
    required this.title,
    required this.type,
    this.selectedCategoryIds,
    this.priceRange,
  });

  @override
  State<ProductsDisplayPage> createState() => _ProductsDisplayPageState();
}

class _ProductsDisplayPageState extends State<ProductsDisplayPage> {
  ProductsDisplayController get productsDisplayController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(ProductsDisplayController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productsDisplayController.loadProducts(
        productType: widget.type,
        selectedCategoryIds: widget.selectedCategoryIds,
        priceRange: widget.priceRange,
      );
    });
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
@override
  void dispose() {
    _refreshController.dispose();
    Get.delete<ProductsDisplayController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: [PendingIds.getProducts],
      appBar: AppBarWidget(
        showBorder: true,
        iconColors: AppColors.blue,
        title: widget.title,
        actions: [AppBarIconShoppingCartWidget()],
      ),
      builder: (context) {
        return SmartRefresherWidget(
          controller: _refreshController,
          onRefresh: () async {
            await productsDisplayController.loadProducts(
              loadMore: false,
              productType: widget.type,
              selectedCategoryIds: widget.selectedCategoryIds,
              priceRange: widget.priceRange,
            );
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            await productsDisplayController.loadProducts(
              loadMore: true,
              selectedCategoryIds: widget.selectedCategoryIds,
              priceRange: widget.priceRange,
              productType: widget.type,
            );
            _refreshController.loadComplete();
          },
          child: SingleChildScrollView(
            child: ProductsListDisplayWidget(title: widget.title, products: productsDisplayController.products, showHeaderTitle: false,),
          ),
        );
      },
    );
  }
}

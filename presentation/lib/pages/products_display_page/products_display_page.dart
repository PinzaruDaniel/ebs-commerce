import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/products_display_page/products_display_controller.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/pages/products_display_page/widgets/search_app_bar_widget.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/widgets/base/base_page.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
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

  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final TextEditingController _textEditingController = TextEditingController();

  bool isExpanded = false;
  static const double collapsedHeight = 56;
  static const double expandedHeight = 106;

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    Get.put(ProductsDisplayController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productsDisplayController.loadProducts(
        productType: widget.type,
        selectedCategoryIds: widget.selectedCategoryIds,
        priceRange: widget.priceRange,
        searchProduct: _textEditingController.text,
      );
    });
    /*
    _textEditingController.addListener(() {
      if (_textEditingController.text.isEmpty) {
        return;
      }

    });*/
  }

  @override
  void dispose() {
    productsDisplayController.debouncer.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
    _refreshController.dispose();
    Get.delete<ProductsDisplayController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: [PendingIds.getProducts],
      builder: (context) {
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: collapsedHeight, end: isExpanded ? expandedHeight : collapsedHeight),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          builder: (context, height, _) {
            final progress = ((height - collapsedHeight) / (expandedHeight - collapsedHeight)).clamp(0.0, 1.0);

            return SmartRefresherWidget(
              controller: _refreshController,
              onRefresh: () async {
                await productsDisplayController.loadProducts(
                  loadMore: false,
                  productType: widget.type,
                  selectedCategoryIds: widget.selectedCategoryIds,
                  priceRange: widget.priceRange,
                  searchProduct: _textEditingController.text,
                );
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                await productsDisplayController.loadProducts(
                  loadMore: true,
                  productType: widget.type,
                  selectedCategoryIds: widget.selectedCategoryIds,
                  priceRange: widget.priceRange,
                  searchProduct: _textEditingController.text,
                );
                _refreshController.loadComplete();
              },
              child: CustomScrollView(
                slivers: [
                  SearchAppBarWidget(
                    isExpanded: isExpanded,
                    height: height,
                    title: widget.title,
                    progress: progress,
                    goBack: () {
                      Get.back();
                    },
                    onChanged: (String value) {
                      productsDisplayController.debouncer.run(() {
                        productsDisplayController.loadProducts(
                          productType: widget.type,
                          selectedCategoryIds: widget.selectedCategoryIds,
                          priceRange: widget.priceRange,
                          searchProduct: value,
                        );
                      });
                    },
                    toggle: toggle,
                    collapsedHeight: collapsedHeight,
                    textEditingController: _textEditingController,
                  ),
                  Obx(() {
                    if (mainAppController.pendingIds.isEmpty && productsDisplayController.products.isEmpty) {
                      return SliverFillRemaining(hasScrollBody: false, child: Center(child: EmptyWidget()));
                    }
                    return SliverList(
                      delegate: SliverChildBuilderDelegate((_, i) {
                        return ProductsListDisplayWidget(
                          title: widget.title,
                          products: productsDisplayController.products,
                          showHeaderTitle: false,
                        );
                      }, childCount: 1),
                    );
                  }),

                  /*SliverList(
                    delegate: SliverChildBuilderDelegate((_, i) {
                      if (mainAppController.pendingIds.isEmpty && productsDisplayController.products.isEmpty) {
                        return EmptyWidget();
                      }
                      return ProductsListDisplayWidget(
                        title: widget.title,
                        products: productsDisplayController.products,
                        showHeaderTitle: false,
                      );
                    }, childCount: 1),
                  ),*/
                ],
              ),
            );
          },
        );
      },
    );
  }
}

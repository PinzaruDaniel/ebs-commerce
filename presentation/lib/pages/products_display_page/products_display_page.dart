import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/products_display_page/products_display_controller.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/widgets/base/base_page.dart';
import 'package:presentation/util/widgets/smart_refresher_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../util/enum/enums.dart';
import '../../util/resources/app_icons.dart';
import '../../util/resources/app_text_styles.dart';
import '../../util/resources/app_texts.dart';
import '../../util/widgets/text_field_widget.dart';

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
      );
    });
  }

  @override
  void dispose() {
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
                );
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                await productsDisplayController.loadProducts(
                  loadMore: true,
                  productType: widget.type,
                  selectedCategoryIds: widget.selectedCategoryIds,
                  priceRange: widget.priceRange,
                );
                _refreshController.loadComplete();
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    snap: !isExpanded,
                    floating: !isExpanded,
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    expandedHeight: height,
                    collapsedHeight: height,
                    shape: const Border(bottom: BorderSide(color: Colors.black12)),
                    title: Text(widget.title, style: AppTextsStyle.bold(size: 18)),
                    leading: IconButton(
                      icon: AppIcons.backIcon(color: AppColors.primary, size: 20),
                      onPressed: () => Get.back(),
                    ),
                    actions: [
                      Opacity(
                        opacity: 1 - progress,
                        child: Transform.scale(
                          scale: 1 - (0.1 * progress),
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: isExpanded ? null : toggle,
                          ),
                        ),
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.only(top: 46.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Opacity(
                            opacity: progress,
                            child: Transform.scale(
                              scale: 0.9 + (0.1 * progress),
                              child: height > collapsedHeight
                                  ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: TextFieldWidget(
                                    itemViewModel: TextFieldViewModel(
                                      hintText: AppTexts.search,
                                      isRequiredValidation: false,
                                    ),
                                    suffixIcon: IconButton(icon: const Icon(Icons.close), onPressed: toggle),

                                  ),
                                ),
                              )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (_, i) => ProductsListDisplayWidget(
                        title: widget.title,
                        products: productsDisplayController.products,
                        showHeaderTitle: false,
                      ),
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}


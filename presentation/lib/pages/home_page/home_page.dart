import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/category_picker_page/category_controller.dart';
import 'package:presentation/pages/home_page/widgets/home_ad_banner_widget.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/circular_progress_indicator_page_widget.dart';
import 'package:presentation/view/base_view_model.dart';import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../util/routing/app_router.dart';
import '../../util/widgets/horizontal_products_list_widget.dart';
import '../filtered_page/filter_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get homeController => Get.find();

  CategoryController get catController => Get.find();

  FilterController get filController => Get.find();


  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    Get.put(CategoryController());
    Get.put(FilterController());
    homeController.initItems();

  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarWidget(
            showBorder: true,
            leading: Image.asset(AppIcons.companyIcon),
            actions: [
              IconButton(
                onPressed: () {
                  AppRouter.openFilterPage();
                },
                icon: AppIcons.filtersIcon,
              ),
              IconButton(
                onPressed: () {
                  AppRouter.openShoppingCartPage();
                },
                icon: AppIcons.cartIcon,
              ),
            ],
          ),
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
                await homeController.getProducts(loadMore: false);
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                await homeController.getProducts(loadMore: true);
                _refreshController.loadComplete();
              },

              child: homeController.isLoading.value
                  ? CircularProgressIndicatorPageWidget(boxConstraints: BoxConstraints(minHeight: 75, minWidth: 75))
                  : ListView.builder(
                itemCount: homeController.items.length,
                itemBuilder: (context, index) {
                  final item = homeController.items[index];
                  if (item is AdBannerViewModel) {
                    return HomeAdBannerWidget();
                  } else if (item is HorizontalProductListViewModel) {
                    print('this is ${item.type}');
                    return HorizontalProductsListWidget(items: item.products, type: item.type);
                  } else if (item is AllProductsViewItem) {
                    return ProductsListDisplayWidget(title: 'ALL PRODUCTS', products: homeController.products);
                  }
                  return null;
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
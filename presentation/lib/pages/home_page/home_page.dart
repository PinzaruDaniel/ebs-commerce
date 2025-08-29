import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/widgets/home_ad_banner_widget.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/mapper/map_text_product_type.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../util/routing/app_router.dart';
import '../../util/widgets/app_bar_icon_shopping_cart_widget.dart';
import '../../util/widgets/horizontal_products_list_widget.dart';
import '../../util/widgets/loading_overlay_widget.dart';
import '../../util/widgets/smart_refresher_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get homeController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.initItems();
    });
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        showBorder: true,
        leading: AppIcons.companyIcon,
        actions: [
          IconButton(
            onPressed: () {
              AppRouter.openFilterPage();
            },
            icon: AppIcons.filtersIcon,
          ),
          AppBarIconShoppingCartWidget(),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              SmartRefresherWidget(
                controller: _refreshController,
                onRefresh: () async {
                  await homeController.getProducts(loadMore: false);
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  await homeController.getProducts(loadMore: true);
                  _refreshController.loadComplete();
                },
                child: ListView.builder(
                  itemCount: homeController.items.length,
                  itemBuilder: (context, index) {
                    final item = homeController.items[index];
                    if (item is AdBannerViewModel) {
                      return HomeAdBannerWidget();
                    } else if (item is HorizontalProductListViewModel) {
                      return HorizontalProductsListWidget(items: item.products, type: item.type);
                    } else if (item is AllProductsViewItem) {
                      return ProductsListDisplayWidget(title: item.type.title ?? '', products: homeController.products);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              if (homeController.isLoading.value)  LoadingOverlayWidget(isLoading: true,),
            ],
          ),
        ),
      ),
    );
  }
}

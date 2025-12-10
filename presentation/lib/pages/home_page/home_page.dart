import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/widgets/home_ad_banner_widget.dart';
import 'package:presentation/pages/home_page/widgets/user_menu/user_menu_widget.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/constants/pending_ids.dart';
import 'package:presentation/util/enum/map_enums.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/util/widgets/base/base_page.dart';
import 'package:presentation/util/widgets/empty_widget.dart';
import 'package:presentation/util/widgets/open_container_animation_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../util/mixins/user_mixins.dart';
import '../../util/widgets/app_bar_icon_shopping_cart_widget.dart';
import '../../util/widgets/horizontal_products_list_widget.dart';
import '../../util/widgets/smart_refresher_widget.dart';
import '../filter_page/filter_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final bool isSessionExpired;

  const HomePage({super.key, this.isSessionExpired = false});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoginFunctions {
  HomeController get homeController => Get.find();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Get.put(HomeController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.initItems();
      if (widget.isSessionExpired) {
        logOut(isSessionExpired: widget.isSessionExpired);
      }
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: [PendingIds.getProducts],
      extendBody: true,
      drawer: Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36), child: UserMenuWidget()),
      drawerEdgeDragWidth: Get.height * 0.1,
      keyPage: _key,
      appBar: AppBarWidget(
        showBorder: true,
        leading: IconButton(
          onPressed: ()  {
             _key.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          OpenContainerAnimation(
            closedShape: CircleBorder(),
            closedBuilder: (context, openContainer) => IconButton(icon: AppIcons.filtersIcon, onPressed: openContainer),
            openBuilder: (context, _) => FilterPage(),
          ),
          AppBarIconShoppingCartWidget(),
        ],
      ),
      builder: (context) {
        return SmartRefresherWidget(
          controller: _refreshController,
          onRefresh: () async {
            await homeController.syncProducts();
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
                return ProductsListDisplayWidget(title: item.type.title ?? '', products: item.products);
              }

              return EmptyWidget();
            },
          ),
        );
      },
    );
  }
}

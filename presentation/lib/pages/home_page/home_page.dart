import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/widgets/home_ad_banner_widget.dart';
import 'package:presentation/pages/home_page/widgets/language_dropdown_widget.dart';
import 'package:presentation/pages/products_display_page/widgets/products_list_display_widget.dart';
import 'package:presentation/util/enum/map_enums.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/widgets/failure_snack_bar_widget.dart';
import 'package:presentation/util/widgets/open_container_animation_widget.dart';
import 'package:presentation/util/widgets/app_bar_widget.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../util/routing/app_router.dart';
import '../../util/widgets/app_bar_icon_shopping_cart_widget.dart';
import '../../util/widgets/horizontal_products_list_widget.dart';
import '../../util/widgets/loading_overlay_widget.dart';
import '../../util/widgets/smart_refresher_widget.dart';
import 'home_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get homeController => Get.find();
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.initItems();
    });
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
      if (result.contains(ConnectivityResult.none)) {
        showFailureSnackBar(fallbackMessage: 'No internet connection', snackPosition: SnackPosition.TOP);
      }
    });
  }
  //TODO: global internet connection controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        showBorder: true,
        leading: AppIcons.companyIcon,
        actions: [
          LanguageDropdown(),
          OpenContainerAnimation(
            closedShape: CircleBorder(),
            closedBuilder: (context, openContainer) {
              return IconButton(icon: AppIcons.filtersIcon, onPressed: openContainer);
            },
            openBuilder: (context, _) => AppRouter.openFilterPage(),
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
                  await homeController.getProducts();
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
                    return const SizedBox.shrink();
                  },
                ),
              ),
              if (homeController.isLoading.value && homeController.currentPage.value == 1)
                LoadingOverlayWidget(isLoading: true),
            ],
          ),
        ),
      ),
    );
  }
}

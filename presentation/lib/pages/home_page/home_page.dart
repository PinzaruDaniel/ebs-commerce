// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/home_page/widgets/home_ad_banner_widget.dart';
import 'package:presentation/pages/home_page/widgets/home_all_products_list_widget.dart';
import 'package:presentation/themes/app_colors.dart';
import 'package:presentation/themes/app_text_styles.dart';
import 'package:presentation/view/base_view_model.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../util/widgets/horizontal_products_list_widget.dart';
import '../shopping_cart_page/shopping_cart_page.dart';
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
    homeController.getProducts();
    homeController.getSaleProducts();
    homeController.getNewProducts();
    homeController.isLoading;
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  /* void _onRefresh*/

  void _onLoading() async {
    await Future.delayed(Duration(seconds: 1));
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            shape: Border(bottom: BorderSide(color: Colors.black12)),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            actions: [
              Image.asset('assets/icons/icon.png'),
              Spacer(),
              IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/filters.svg')),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCartPage()));
                },
                icon: SvgPicture.asset('assets/icons/Cart icon.svg'),
              ),
            ],
          ),
          body: SafeArea(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropMaterialHeader(
                distance: 50,
                color: AppColors.primary,
                backgroundColor: Colors.grey.shade100,
              ),
              controller: _refreshController,
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 1));
                _refreshController.refreshCompleted();
                if (mounted) {
                  setState(() {});
                }
              },
              onLoading: _onLoading,

              child: homeController.isLoading.value
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 3,
                            constraints: BoxConstraints(minWidth: 75, minHeight: 75),
                          ),
                          Text('Loading', style: AppTextsStyle.medium.copyWith(color: Colors.grey.shade500)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: homeController.items.length,
                      itemBuilder: (context, index) {
                        final item = homeController.items[index];
                        if (item is AdBannerViewModel) {
                          return HomeAdBannerWidget();
                        } else if (item is HorizontalProductListViewModel) {
                          return HorizontalProductsListWidget(items: item.products, type: item.type);
                        } else if (item is AllProductsViewItem) {
                          return AllProductsListWidget(item: item);
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

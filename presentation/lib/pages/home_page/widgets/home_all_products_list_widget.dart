import 'package:get/get.dart';
import 'package:presentation/pages/home_page/home_controller.dart';
import 'package:presentation/util/widgets/circular_progress_indicator_page_widget.dart';
import 'package:presentation/util/widgets/header_title_widget.dart';
import 'package:flutter/material.dart';
import '../../../util/resources/app_texts.dart';
import '../../../view/base_view_model.dart';
import 'home_products_item_widget.dart';

class AllProductsListWidget extends StatefulWidget {
  const AllProductsListWidget({super.key, required this.item});

  final AllProductsViewItem item;

  @override
  State<AllProductsListWidget> createState() => _AllProductsListWidgetState();
}

class _AllProductsListWidgetState extends State<AllProductsListWidget> {
  HomeController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CircularProgressIndicatorPageWidget(boxConstraints: BoxConstraints(minHeight: 40, minWidth: 40));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24, bottom: 8, left: 16),
            child: HeaderTitleWidget(title: AppTexts.allProducts, showDivider: true),
          ),
          SizedBox(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
              padding: EdgeInsets.only(left: 8.0, top: 16),
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                var itemProducts = controller.products[index];
                return HomeProductsItemWidget(item: itemProducts, width: 180);
              },
            ),
          ),
        ],
      );
    });

  }
}

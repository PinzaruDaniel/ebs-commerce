import 'package:flutter/material.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../util/widgets/header_title_widget.dart';
import '../home_page/widgets/home_products_item_widget.dart';

class FilteredProductsPage extends StatelessWidget {
  const FilteredProductsPage({super.key, required this.items});

  final List<ProductViewModel> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 16),
                child: HeaderTitleWidget(title: 'ALL PRODUCTS', showDivider: true),
              ),
              SizedBox(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
                  padding: EdgeInsets.only(left: 8.0, top: 16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var itemProducts = items[index];
                    return HomeProductsItemWidget(item: itemProducts, width: 180);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

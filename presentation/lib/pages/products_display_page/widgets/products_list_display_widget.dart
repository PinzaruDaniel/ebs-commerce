import 'package:flutter/material.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../util/widgets/header_title_widget.dart';
import '../../home_page/widgets/home_products_item_widget.dart';

class ProductsListDisplayWidget extends StatelessWidget {
  final String title;
  final AllProductsViewItem item;
  final bool? showHeaderTitle;

  const ProductsListDisplayWidget({super.key, required this.item, required this.title, this.showHeaderTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(showHeaderTitle!=false)
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 16),
                child: HeaderTitleWidget(title: title, showDivider: true),
              ),
              SizedBox(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
                  padding: EdgeInsets.only(left: 8.0, top: 16),
                  itemCount: item.items.length,
                  itemBuilder: (context, index) {
                    var itemProducts = item.items[index];
                    return HomeProductsItemWidget(item: itemProducts, width: 180);
                  },
                ),
              ),
            ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:presentation/view/product_view_model.dart';

import '../../pages/products_display_page/products_display_controller.dart';
import 'header_title_widget.dart';
import '../../pages/home_page/widgets/home_products_item_widget.dart';

extension MapTextProductType on ProductListType {
  String? get title {
    switch (this) {
      case ProductListType.newProducts:
        return 'NEW PRODUCTS';
      case ProductListType.saleProducts:
        return 'SALE PRODUCTS';
      default:
        return null;
    }
  }
}

class HorizontalProductsListWidget extends StatefulWidget {
  const HorizontalProductsListWidget({super.key, required this.items, required this.type});

  final List<ProductViewModel> items;
  final ProductListType type;

  @override
  State<HorizontalProductsListWidget> createState() => _HorizontalProductsListWidgetState();
}

class _HorizontalProductsListWidgetState extends State<HorizontalProductsListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24, bottom: 8, left: 16),
          child: HeaderTitleWidget(
            itemViewModel: HeaderTitleViewModel(
              title: widget.type.title!,
              showDivider: true,
              showSeeAll: true,
              type: widget.type,
            ),
          ),
        ),

        widget.items.isNotEmpty
            ? SizedBox(
                height: 280,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 12, left: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) {
                    final itemProduct = widget.items[index];
                    return HomeProductsItemWidget(item: itemProduct, width: 180);
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Text('No products with sale', style: TextStyle(fontSize: 16, color: Colors.grey)),
              ),
      ],
    );
  }
}

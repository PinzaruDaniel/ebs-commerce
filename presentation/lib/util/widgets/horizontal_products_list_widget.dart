import 'package:flutter/material.dart';
import 'package:presentation/view/product_view_model.dart';

import 'header_title_widget.dart';
import '../../pages/home_page/widgets/home_products_item_widget.dart';

enum ProductType {
  newProducts('new_products'),
  saleProducts('sale_products');

  const ProductType(this.value);

  final String value;
}

extension MapTextProductType on ProductType {
  String get title {
    switch (this) {
      case ProductType.newProducts:
        return 'NEW PRODUCTS';
      case ProductType.saleProducts:
        return 'SALE PRODUCTS';
    }
  }
}

class HorizontalProductsListWidget extends StatefulWidget {
  const HorizontalProductsListWidget({super.key, required this.items, required this.type});

  final List<ProductViewModel> items;
  final ProductType type;

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
            title: widget.type.title,
            showDivider: true,
            showSeeAll: true,
            items: widget.items,
          ),
        ),

        widget.items.isNotEmpty
            ? Container(
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
          child: Text(
            'No products with sale',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );

  }
}


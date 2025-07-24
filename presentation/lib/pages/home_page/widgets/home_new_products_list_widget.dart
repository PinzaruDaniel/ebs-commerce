import 'package:presentation/util/widgets/header_title_widget.dart';

import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

import 'home_products_item_widget.dart';

class HomeNewProductsListWidget extends StatefulWidget {
  const HomeNewProductsListWidget({super.key, required this.item});
  final List<ProductViewModel> item;

  @override
  State<HomeNewProductsListWidget> createState() => _HomeNewProductsListWidgetState();
}

class _HomeNewProductsListWidgetState extends State<HomeNewProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTitleWidget(title: 'NEW PRODUCTS', showDivider: true,),
        Container(
          height: 250,
          child: ListView.builder(
              padding: EdgeInsets.only(top: 12, left: 8),
              scrollDirection: Axis.horizontal,
              itemCount: widget.item.length,
              itemBuilder: (context, index){
                if(index%2==0){
                var itemProducts=widget.item[index];
                return HomeProductsItemWidget(item: itemProducts, width: 180,);}
                else{
                  return SizedBox.shrink();
                }
              }),
        )
      ],
    );
  }
}

/*
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shopping_cart_page/shopping_cart_page.dart';

class HomeAppBarIconsWidget extends StatefulWidget {
  const HomeAppBarIconsWidget({super.key, required this.items});

  final ProductViewModel items;

  @override
  State<HomeAppBarIconsWidget> createState() => _HomeAppBarIconsWidgetState();
}

class _HomeAppBarIconsWidgetState extends State<HomeAppBarIconsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/icons/icon.png'),
        Spacer(),
        IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/filters.svg')),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCartPage(items: widget.items)));
          },
          icon: SvgPicture.asset('assets/icons/Cart icon.svg'),
        ),
      ],
    );
  }
}
*/

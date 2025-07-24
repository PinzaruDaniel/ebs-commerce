import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class ProductDetailAddButtonWidget extends StatefulWidget {
  const ProductDetailAddButtonWidget({super.key});

  @override
  State<ProductDetailAddButtonWidget> createState() => _ProductDetailAddButtonWidgetState();
}

class _ProductDetailAddButtonWidgetState extends State<ProductDetailAddButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 2
                  ),
                  onPressed: (){}, child:
              Text('add to cart', style: TextStyle(color: Colors.white),))
            ],
          ),
        )
      ],
    );
  }
}

import 'package:presentation/view/cart_products_view_model.dart';
import 'package:flutter/material.dart';
import '../../../util/resources/app_colors.dart';

class ShoppingCartCheckboxWidget extends StatefulWidget {
  const ShoppingCartCheckboxWidget({super.key, required this.item});

  final CartItem item;

  @override
  State<ShoppingCartCheckboxWidget> createState() => _ShoppingCartCheckboxWidgetState();
}

class _ShoppingCartCheckboxWidgetState extends State<ShoppingCartCheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              side: BorderSide(color: Colors.grey.shade300, width: 2),
              activeColor: AppColors.primary,
              value: widget.item.isSelected,
              onChanged: (bool? value) {
                setState(() {
                  widget.item.isSelected = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

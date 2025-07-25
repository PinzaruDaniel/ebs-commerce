import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/cupertino.dart';

class AddToCartPopUpImageWidget extends StatelessWidget {
  const AddToCartPopUpImageWidget({super.key, required this.item});
  final ProductViewModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(item.imageUrl?[0] ?? 'assets/products/noimage.png', height: 100, width: 100, fit: BoxFit.cover),
        ),
      ],
    );
  }
}

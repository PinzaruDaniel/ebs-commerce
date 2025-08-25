import 'package:flutter/material.dart';
import 'package:presentation/view/product_view_model.dart';


import 'package:cached_network_image/cached_network_image.dart';

class AddToCartPopUpImageWidget extends StatelessWidget {
  final ProductViewModel item;

  const AddToCartPopUpImageWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: item.imageUrl![0],
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}

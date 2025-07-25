import 'package:presentation/themes/app_text_styles.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';

class HomeProductsItemWidget extends StatefulWidget {
  const HomeProductsItemWidget({super.key, required this.item, this.width});

  final ProductViewModel item;
  final double? width;

  @override
  State<HomeProductsItemWidget> createState() => _HomeProductsItemWidgetState();
}

class _HomeProductsItemWidgetState extends State<HomeProductsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        AppRouter.openDetailsPage(item: widget.item);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(
                  image: AssetImage(widget.item.imageUrl?[0] ?? 'assets/products/noimage.png'),
                  height: 150,
                  width: widget.width,
                  fit: BoxFit.cover,
                ),
              ),

              Text(widget.item.title, style: AppTextsStyle.medium),
              Text(widget.item.company ?? '', style: AppTextsStyle.medium),
              Text('\$ ${widget.item.price ?? '-'}', style: AppTextsStyle.boldBig.copyWith(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

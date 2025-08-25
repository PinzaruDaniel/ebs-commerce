import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/product_image_widget.dart';
import 'package:presentation/view/product_view_model.dart';
import 'package:flutter/material.dart';


class HomeProductsItemWidget extends StatefulWidget {
  const HomeProductsItemWidget({super.key, required this.item, this.width, this.height});

  final ProductViewModel item;
  final double? width;
  final double? height;

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
        child: SizedBox(width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: ProductImageWidget(height: widget.height ?? 150,
                      width: double.infinity,
                      imageUrl: widget.item.imageUrl != null && widget.item.imageUrl!.isNotEmpty ? widget.item
                          .imageUrl![0] : null, )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(widget.item.title, style: AppTextsStyle.medium),
              ),
              Text(widget.item.company?[AppTexts.brand] as String? ?? '', style: AppTextsStyle.medium),
              Text('\$ ${widget.item.price ?? '-'} ', style: AppTextsStyle.bold()),
            ],
          ),
        ),
      ),
    );
  }
}

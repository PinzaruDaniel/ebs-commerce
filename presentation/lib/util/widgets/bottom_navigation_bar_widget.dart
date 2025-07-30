import 'package:flutter_svg/svg.dart';
import 'package:presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:presentation/view/product_view_model.dart';


class BottomNavigationBarWidget extends StatelessWidget {
  final ProductViewModel item;
  final String title;
  final Function? router;
  final bool showIcon;

  const BottomNavigationBarWidget({
    super.key,
    required this.item,
    required this.title,
     this.router,
    required this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 12)],
      ),
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 28),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
        ),
        onPressed: () {
          router?.call();
          /*showModalBottomSheet(
            backgroundColor: Colors.white,
            showDragHandle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            ),
            context: context,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [Expanded(child: ProductDetailAddToCartBottomSheetWidget(item: item))],
              ),
            ),
          );*/
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/Union.svg', height: 14),
            SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

}

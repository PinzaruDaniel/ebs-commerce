import 'package:flutter_svg/svg.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:presentation/util/resources/app_icons.dart';
import 'package:presentation/util/resources/app_texts.dart';
import 'package:presentation/util/routing/app_pop_up.dart';
import 'package:presentation/view/product_view_model.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final ProductViewModel item;
  final String title;
  final Function? router;
  final bool? addToCart;
  final bool showIcon;

  const BottomNavigationBarWidget({
    super.key,
    required this.item,
    required this.title,
    this.router,
    required this.showIcon,
    this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 12)],
      ),
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 28),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: (addToCart ?? true) ? AppColors.primary : Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
        ),
        onPressed: () {
          if (addToCart == true) {
            if (router != null) {
              router?.call();
            } else {
              AppPopUp.showCartInfoPopUp(item: item);
            }
          } else if(addToCart == false) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text(AppTexts.oops),
                content: Text(AppTexts.cantAddToCart),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(AppTexts.ok, style: TextStyle(color: AppColors.primary)),
                  ),
                ],
              ),
            );
          }
          else{
            router?.call();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon ? AppIcons.toCartIcon : SizedBox.shrink(),
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

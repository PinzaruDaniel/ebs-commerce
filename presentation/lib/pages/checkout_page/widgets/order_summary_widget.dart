import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/view/base_view_model.dart';

import '../../../controllers/controller_imports.dart';

class OrderSummaryViewModel extends BaseViewModel {
  final RxDouble subtotal = RxDouble(0.0);
  final RxDouble shippingFee = RxDouble(0.0);
  final double adminFee = 2.0;
  final RxDouble voucherDiscount = RxDouble(0.0);
  final RxDouble total = RxDouble(0.0);

}


class OrderSummaryWidget extends StatelessWidget {
  final orderSummary = checkoutController.allItems
      .whereType<OrderSummaryViewModel>()
      .first;
   OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSummaryRow(
                'Subtotal',
                '\$${orderSummary.subtotal.value}',
              ),
              if (orderSummary.shippingFee.value > 0)
                buildSummaryRow(
                  'Shipping Fee',
                  '\$${orderSummary.shippingFee.value}',
                ),
              buildSummaryRow(
                'Admin Fee',
                '\$${orderSummary.adminFee}',
              ),
              if (orderSummary.voucherDiscount.value > 0)
                buildSummaryRow(
                  'Voucher Code',
                  '- \$${orderSummary.voucherDiscount.value}',
                  color: AppColors.redText,
                ),
              buildSummaryRow(
                'Total',
                '\$${orderSummary.total.value}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSummaryRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextsStyle.medium,
          ),
          Text(
            value,
            style: AppTextsStyle.bold(size: 14).copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/app_text_styles.dart';
import 'package:presentation/view/base_view_model.dart';

class OrderSummaryViewModel extends BaseViewModel {
  final RxDouble subtotal = RxDouble(0.0);
  final RxDouble shippingFee = RxDouble(0.0);
  final RxDouble adminFee = RxDouble(2.0);
  final RxDouble voucherDiscount = RxDouble(0.0);
  final RxDouble total = RxDouble(0.0);

}


class OrderSummaryWidget extends StatelessWidget {
  final OrderSummaryViewModel orderSummary;

  const OrderSummaryWidget({super.key, required this.orderSummary});

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
              _buildSummaryRow(
                'Subtotal',
                '\$${orderSummary.subtotal.value}',
              ),
              if (orderSummary.shippingFee.value > 0)
                _buildSummaryRow(
                  'Shipping Fee',
                  '\$${orderSummary.shippingFee.value}',
                ),
              _buildSummaryRow(
                'Admin Fee',
                '\$${orderSummary.adminFee.value}',
              ),
              if (orderSummary.voucherDiscount.value > 0)
                _buildSummaryRow(
                  'Voucher Code',
                  '- \$${orderSummary.voucherDiscount.value}',
                  color: AppColors.redText,
                ),
              _buildSummaryRow(
                'Total',
                '\$${orderSummary.total.value}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {Color? color}) {
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

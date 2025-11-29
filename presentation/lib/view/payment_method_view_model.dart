import 'package:presentation/util/resources/app_texts.dart';

class PaymentMethodViewModel {
  final String key;
  final String titleKey;

  const PaymentMethodViewModel({required this.key, required this.titleKey});
}

final List<PaymentMethodViewModel> paymentMethods = [
  PaymentMethodViewModel(key: 'paypal', titleKey: 'PayPal'),
  PaymentMethodViewModel(key: 'cash', titleKey: AppTexts.cashPaymentMethod),
];
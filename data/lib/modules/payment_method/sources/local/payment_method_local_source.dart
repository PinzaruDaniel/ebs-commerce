import 'package:data/mapper/payment_method_mapper.dart';
import 'package:data/modules/payment_method/models/local/payment_method_box.dart';
import 'package:domain/modules/user_information/models/index.dart';

import 'package:objectbox/objectbox.dart';
abstract class PaymentMethodLocalSource{
  Future<void> setPaymentMethod({required PaymentMethodEntity paymentMethod});
  Future <PaymentMethodBox?> getPaymentMethod();
}

class PaymentMethodLocalDataSourceImpl implements PaymentMethodLocalSource{
  Box<PaymentMethodBox> paymentMethodBox;
  PaymentMethodLocalDataSourceImpl({required this.paymentMethodBox});

  @override
  Future<void> setPaymentMethod({required PaymentMethodEntity paymentMethod})async{
    paymentMethodBox.put(paymentMethod.toBox);
  }

  @override
  Future<PaymentMethodBox?> getPaymentMethod() async{
    final paymentMethod=paymentMethodBox.getAll();
    if(paymentMethod.isEmpty) return null;
    return paymentMethod.last;
  }
}
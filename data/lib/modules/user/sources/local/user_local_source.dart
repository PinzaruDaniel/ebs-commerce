import 'package:common/constants/logger.dart';
import 'package:data/mapper/delivery_address_mapper.dart';
import 'package:data/mapper/payment_method_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/models/local/user_box.dart';
import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:objectbox/objectbox.dart';

import '../../../delivery_address/models/local/delivery_address_box.dart';
import '../../../payment_method/models/local/payment_method_box.dart';

abstract class UserLocalSource {
  Future<void> setUser({required UserEntity user});

  Future<void> setDeliveryAddress({required DeliveryAddressEntity deliveryAddress});

  Future<void> setPaymentMethod({required PaymentMethodEntity paymentMethod});

  Future<UserBox?> getUser();

  Future<PaymentMethodBox> getPaymentMethod();

  Future<DeliveryAddressBox> getDeliveryAddress();
}

class UserLocalDataSourceImpl implements UserLocalSource {
  Box<UserBox> userBox;
  Box<DeliveryAddressBox> deliveryAddressBox;
  Box<PaymentMethodBox> paymentMethodBox;

  UserLocalDataSourceImpl({required this.userBox, required this.deliveryAddressBox, required this.paymentMethodBox});

  @override
  Future<void> setUser({required UserEntity user}) async {
    userBox.put(UserToBoxMapper(user).toBox);
  }

  @override
  Future<void> setDeliveryAddress({required DeliveryAddressEntity deliveryAddress}) async {
    deliveryAddressBox.putAsync(DeliveryAddressToBoxMapper(deliveryAddress).toBox);
    var delivery = await deliveryAddressBox.getAllAsync();

    final user = await getUser();
    user?.deliveryAddressBox.target = delivery.last;//DeliveryAddressToBoxMapper(deliveryAddress).toBox;
    /*consoleLog(addressId);
    consoleLog(user?.id);*/
    userBox.put(user!);
    consoleLog('setDeliveryAddress  ${user.deliveryAddressBox.target?.pickupLocation}');
  }

  @override
  Future<void> setPaymentMethod({required PaymentMethodEntity paymentMethod}) async {
    final paymentMethodId = paymentMethodBox.put(PaymentMethodToBoxMapper(paymentMethod).toBox);
    final user = await getUser();
    user?.paymentMethodBox.targetId = paymentMethodId;
    userBox.put(user!);
  }

  @override
  Future<UserBox?> getUser() async {
    final users = userBox.getAll();
    return users.last;
  }

  @override
  Future<DeliveryAddressBox> getDeliveryAddress() async {
    final deliveryAddress = deliveryAddressBox.getAll();
    consoleLog(deliveryAddress.last.id);
    return deliveryAddress.last;
  }

  @override
  Future<PaymentMethodBox> getPaymentMethod() async {
    final paymentMethod = paymentMethodBox.getAll();
    return paymentMethod.last;
  }
}

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

  Stream<UserBox?> getUser();

  Future<PaymentMethodBox?> getPaymentMethod();

  Future<DeliveryAddressBox?> getDeliveryAddress();
}

class UserLocalDataSourceImpl implements UserLocalSource {
  Box<UserBox> userBox;
  Box<DeliveryAddressBox> deliveryAddressBox;
  Box<PaymentMethodBox> paymentMethodBox;

  UserLocalDataSourceImpl({required this.userBox, required this.deliveryAddressBox, required this.paymentMethodBox});

  @override
  Future<void> setUser({required UserEntity user}) async {
    final existingUsers = await userBox.getAllAsync();
    if (existingUsers.isNotEmpty) {
      final lastId = existingUsers.last.id;
      final existingUser = userBox.get(lastId);
      final updatedUserBox = UserToBoxMapper(user).toBox;
      updatedUserBox.id = existingUser!.id;
      updatedUserBox.deliveryAddressBox.targetId = existingUser.deliveryAddressBox.targetId;
      updatedUserBox.paymentMethodBox.targetId = existingUser.paymentMethodBox.targetId;
      userBox.put(updatedUserBox);
    } else {
      final newUserBox = UserToBoxMapper(user).toBox;
      userBox.put(newUserBox);
    }
  }

  @override
  Future<void> setDeliveryAddress({required DeliveryAddressEntity deliveryAddress}) async {
    final addressId = await deliveryAddressBox.putAsync(DeliveryAddressToBoxMapper(deliveryAddress).toBox);
    final user = await getUser().last;

    if (user != null) {
      user.deliveryAddressBox.targetId = addressId;
      userBox.put(user);
    }
  }

  @override
  Future<void> setPaymentMethod({required PaymentMethodEntity paymentMethod}) async {
    final paymentMethodId = await paymentMethodBox.putAsync(PaymentMethodToBoxMapper(paymentMethod).toBox);
    final user = await getUser().last;

    if (user != null) {
      user.paymentMethodBox.targetId = paymentMethodId;
      userBox.put(user);
    }
  }

  @override
  Stream<UserBox?> getUser() {
    return userBox.query().watch(triggerImmediately: true).map((query) => query.find().toList().last);
  }


  @override
  Future<DeliveryAddressBox?> getDeliveryAddress() async {
    final deliveryAddress = deliveryAddressBox.getAll();
    if (deliveryAddress.isEmpty) return null;
    return deliveryAddress.last;
  }

  @override
  Future<PaymentMethodBox?> getPaymentMethod() async {
    final paymentMethod = paymentMethodBox.getAll();
    if (paymentMethod.isEmpty) return null;
    return paymentMethod.last;
  }
}

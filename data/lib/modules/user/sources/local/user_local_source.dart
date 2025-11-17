import 'package:common/constants/logger.dart';
import 'package:data/mapper/delivery_address_mapper.dart';
import 'package:data/mapper/payment_method_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/models/local/user_box.dart';
import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:objectbox/objectbox.dart';

import '../../../../objectbox.g.dart';
import '../../../delivery_address/models/local/delivery_address_box.dart';
import '../../../payment_method/models/local/payment_method_box.dart';

abstract class UserLocalSource {
  Future<void> setUser({required UserEntity user});

  Future<void> setDeliveryAddress({required int idUser, required DeliveryAddressEntity deliveryAddress});

  Future<void> setPaymentMethod({required int idUser, required PaymentMethodEntity paymentMethod});

  Stream<UserBox?> getUser(int id);

  Future<PaymentMethodBox?> getPaymentMethod(int idUser);

  Future<DeliveryAddressBox?> getDeliveryAddress(int idUser);

  Future<void> deleteAllUsers();
}

class UserLocalDataSourceImpl implements UserLocalSource {
  final Box<UserBox> userBox;
  final Box<DeliveryAddressBox> deliveryAddressBox;
  final Box<PaymentMethodBox> paymentMethodBox;

  UserLocalDataSourceImpl({required this.userBox, required this.deliveryAddressBox, required this.paymentMethodBox});

  @override
  Future<void> setUser({required UserEntity user}) async {
    consoleLog('Saving user: ${user.number ?? ''}');
    final userBoxModel = UserToBoxMapper(user).toBox;

    if (user.idUser != null) {
      final existingUser = await userBox.getAsync(user.idUser!);
      if (existingUser != null) {
        userBoxModel.idUser = existingUser.idUser;
        userBoxModel.deliveryAddressBox.targetId = existingUser.deliveryAddressBox.targetId;
        userBoxModel.paymentMethodBox.targetId = existingUser.paymentMethodBox.targetId;
      }
    }

    await userBox.putAsync(userBoxModel);
  }

  @override
  Future<void> setDeliveryAddress({required int idUser, required DeliveryAddressEntity deliveryAddress}) async {
    final user = await userBox.getAsync(idUser);
    if (user == null) return;

    final addressBoxModel = DeliveryAddressToBoxMapper(deliveryAddress).toBox;
    final addressId = await deliveryAddressBox.putAsync(addressBoxModel);

    user.deliveryAddressBox.targetId = addressId;
    await userBox.putAsync(user);
  }

  @override
  Future<void> setPaymentMethod({required int idUser, required PaymentMethodEntity paymentMethod}) async {
    final user = await userBox.getAsync(idUser);
    if (user == null) return;

    final paymentBoxModel = PaymentMethodToBoxMapper(paymentMethod).toBox;
    final paymentId = await paymentMethodBox.putAsync(paymentBoxModel);

    user.paymentMethodBox.targetId = paymentId;
    await userBox.putAsync(user);
  }

  @override
  Stream<UserBox?> getUser(int idUser) {
    return userBox.query(UserBox_.idUser.equals(idUser)).watch(triggerImmediately: true).map((query) => query.findFirst());
  }

  @override
  Future<DeliveryAddressBox?> getDeliveryAddress(int idUser) async {
    final user = await userBox.getAsync(idUser);
    return user?.deliveryAddressBox.target;
  }

  @override
  Future<PaymentMethodBox?> getPaymentMethod(int idUser) async {
    final user = await userBox.getAsync(idUser);
    return user?.paymentMethodBox.target;
  }

  @override
  Future<void> deleteAllUsers() async {
    userBox.removeAll();
  }
}

import 'package:common/constants/logger.dart';
import 'package:data/mapper/delivery_address_mapper.dart';
import 'package:data/mapper/payment_method_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/sources/local/user_local_source.dart';
import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class UserInformationRepositoryImpl implements UserInformationRepository {
  final UserLocalSource userLocalSource;

  UserInformationRepositoryImpl({required this.userLocalSource});

  @override
  Future<void> setUser(UserEntity user) async {
    await userLocalSource.setUser(user: user);
  }

  @override
  Future<void> setDeliveryAddress(DeliveryAddressEntity deliveryAddress) async {
    await userLocalSource.setDeliveryAddress(deliveryAddress: deliveryAddress);
  }

  @override
  Future<void> setPaymentMethod(PaymentMethodEntity paymentMethod) async {
    await userLocalSource.setPaymentMethod(paymentMethod: paymentMethod);
  }
  @override
  Future<UserEntity?> getUser() async {
    final userBox = await userLocalSource.getUser();
    consoleLog('get user box ${userBox?.id} ${userBox?.name} ${userBox?.deliveryAddressBox.target?.pickupLocation} ');
    return userBox?.toEntity;
  }

  @override
  Future<DeliveryAddressEntity?> getDeliveryAddress() async {
    final deliveryAddress = await userLocalSource.getDeliveryAddress();
    return deliveryAddress.toEntity;
  }

  @override
  Future<PaymentMethodEntity?> getPaymentMethod() async {
    final paymentMethod = await userLocalSource.getPaymentMethod();
    return paymentMethod.toEntity;
  }

}

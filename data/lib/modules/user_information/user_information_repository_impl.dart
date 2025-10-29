import 'package:data/mapper/delivery_address_mapper.dart';
import 'package:data/mapper/payment_method_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user_information/sources/local/delivery_address/delivery_address_local_source.dart';
import 'package:data/modules/user_information/sources/local/payment_method/payment_method_local_source.dart';
import 'package:data/modules/user_information/sources/local/user/user_local_source.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class UserInformationRepositoryImpl implements UserInformationRepository {
  final UserLocalSource userLocalSource;
  final PaymentMethodLocalSource paymentMethodLocalSource;
  final DeliveryAddressLocalSource deliveryAddressLocalSource;

  UserInformationRepositoryImpl({
    required this.userLocalSource,
    required this.paymentMethodLocalSource,
    required this.deliveryAddressLocalSource,
  });

  @override
  Future<void> setUserLocalCache(UserEntity user) {
    return userLocalSource.setUser(user: user);
  }

  @override
  Future<UserEntity> getUserLocalCache() async {
    final user = await userLocalSource.getUser();
    return user.toEntity;
  }

  @override
  Future<void> setPaymentMethodLocalCache(PaymentMethodEntity paymentMethod) {
    return paymentMethodLocalSource.setPaymentMethod(paymentMethod: paymentMethod);
  }

  @override
  Future<PaymentMethodEntity> getPaymentMethodLocalCache() async {
    final paymentMethod = await paymentMethodLocalSource.getPaymentMethod();
    return paymentMethod.toEntity;
  }

  @override
  Future<void> setDeliveryAddressLocalCache(DeliveryAddressEntity deliveryAddress) {
    return deliveryAddressLocalSource.setDeliveryAddress(deliveryAddress: deliveryAddress);
  }

  @override
  Future<DeliveryAddressEntity> getDeliveryAddressLocalCache() async {
    final deliveryAddress = await deliveryAddressLocalSource.getDeliveryAddress();
    return deliveryAddress.toEntity;
  }
}

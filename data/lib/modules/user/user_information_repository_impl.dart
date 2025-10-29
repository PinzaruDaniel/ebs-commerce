import 'package:data/mapper/delivery_address_mapper.dart';
import 'package:data/mapper/payment_method_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/sources/local/user_local_source.dart';
import 'package:data/modules/payment_method/sources/local/payment_method_local_source.dart';
import 'package:data/modules/delivery_address/sources/local/delivery_address_local_source.dart';
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
  Future<void> setUser(UserEntity user) async {
    await userLocalSource.setUser(user: user);
    if (user.paymentMethodEntity != null) {
      await paymentMethodLocalSource.setPaymentMethod(paymentMethod: user.paymentMethodEntity!);
    }

    if (user.deliveryAddressEntity != null) {
      await deliveryAddressLocalSource.setDeliveryAddress(deliveryAddress: user.deliveryAddressEntity!);
    }
  }

  @override
  Future<UserEntity?> getUser() async {
    final userBox = await userLocalSource.getUser();
    if (userBox == null) return null;

    final paymentMethod = await paymentMethodLocalSource.getPaymentMethod();
    final deliveryAddress = await deliveryAddressLocalSource.getDeliveryAddress();

    return userBox.toEntity.copyWith(
      paymentMethodEntity: paymentMethod?.toEntity,
      deliveryAddressEntity: deliveryAddress?.toEntity,
    );
  }
}

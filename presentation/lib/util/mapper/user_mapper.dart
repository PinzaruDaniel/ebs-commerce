import 'package:domain/modules/user_information/models/index.dart';
import 'package:presentation/util/mapper/delivery_address_mapper.dart';
import 'package:presentation/util/mapper/payment_method_mapper.dart';
import 'package:presentation/view/user_view_model.dart';

extension UserToEntityMapper on UserViewModel {
  UserEntity get toEntity {
    return UserEntity(
      name: name ?? '',
      surname: surname ?? '',
      number: number,
      dialCode: dialCode,
      email: email ?? '',
      imageUrl: imageUrl ?? '',
      deliveryAddressEntity: deliveryAddressViewModel?.toEntity,
      paymentMethodEntity: paymentMethodViewModel?.toEntity,
    );
  }
}

extension UserToModelMapper on UserEntity {
  UserViewModel get toModel {
    return UserViewModel(
      name: name,
      surname: surname,
      number: number ?? '',
      dialCode: dialCode ?? '',
      email: email,
      imageUrl: imageUrl ?? '',
      deliveryAddressViewModel: deliveryAddressEntity?.toModel,
      paymentMethodViewModel: paymentMethodEntity?.toModel,
    );
  }
}

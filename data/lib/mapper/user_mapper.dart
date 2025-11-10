import 'package:data/mapper/delivery_address_mapper.dart';
import 'package:data/mapper/payment_method_mapper.dart';
import 'package:data/modules/user/models/local/user_box.dart';
import 'package:data/modules/user/models/remote/index.dart';
import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:domain/modules/user_information/models/index.dart';

extension UserToEntityMapper on UserBox {
  UserEntity get toEntity {
    return UserEntity(
      name: name,
      surname: surname,
      number: number,
      dialCode: dialCode,
      email: email,
      imageUrl: imageUrl,
      deliveryAddressEntity: deliveryAddressBox.target?.toEntity,
      paymentMethodEntity: paymentMethodBox.target?.toEntity,
    );
  }
}

extension UserToBoxMapper on UserEntity {
  UserBox get toBox {
    final box = UserBox(
      id: id ?? 0,
      name: name,
      surname: surname,
      number: number ?? '',
      dialCode: dialCode ?? '',
      email: email,
      imageUrl: imageUrl,
    );

    if (deliveryAddressEntity != null) {
      box.deliveryAddressBox.target = deliveryAddressEntity!.toBox;
    }
    if (paymentMethodEntity != null) {
      box.paymentMethodBox.target = paymentMethodEntity!.toBox;
    }
    return box;
  }
}

extension UserFromDtoToEntityMapper on UserApiDto {
  UserEntity get toEntity {
    return UserEntity(
      name: firstName,
      surname: lastName,
      email: email,
      imageUrl: imageUrl,
      deliveryAddressEntity: DeliveryAddressEntity(
        country: address.country,
        region: address.state,
        city: address.city,
        postalCode: address.zip,
        address: address.street,
        deliveryType: '',
      ),
    );
  }
}

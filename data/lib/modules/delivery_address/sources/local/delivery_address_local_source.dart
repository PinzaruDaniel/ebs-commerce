import 'package:data/mapper/delivery_address_mapper.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:objectbox/objectbox.dart';

import '../../models/local/delivery_address_box.dart';

abstract class DeliveryAddressLocalSource {
  Future<void> setDeliveryAddress({required DeliveryAddressEntity deliveryAddress});

  Future<DeliveryAddressBox> getDeliveryAddress();
}

class DeliveryAddressLocalDataSourceImpl implements DeliveryAddressLocalSource {
  Box<DeliveryAddressBox> deliveryAddressBox;

  DeliveryAddressLocalDataSourceImpl({required this.deliveryAddressBox});

  @override
  Future<void> setDeliveryAddress({required DeliveryAddressEntity deliveryAddress}) async {
    deliveryAddressBox.put(deliveryAddress.toBox);
  }
  @override
  Future<DeliveryAddressBox> getDeliveryAddress() async {
    final deliveryAddress=deliveryAddressBox.getAll();
    return deliveryAddress.last;
  }
}

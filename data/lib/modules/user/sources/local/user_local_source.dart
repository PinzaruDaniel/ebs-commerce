import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/models/local/user_box.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:objectbox/objectbox.dart';

abstract class UserLocalSource {
  Future<void> setUser({required UserEntity user});

  Future<UserBox?> getUser();
}

class UserLocalDataSourceImpl implements UserLocalSource {
  Box<UserBox> userBox;

  UserLocalDataSourceImpl({required this.userBox});

  @override
  Future<void> setUser({required UserEntity user}) async {
    // Print all user info
    print('--- 🧍 USER INFO ---');
    print('ID: ${user.id}');
    print('Name: ${user.name}');
    print('Surname: ${user.surname}');
    print('Number: ${user.number}');
    print('Dial code: ${user.dialCode}');
    print('Email: ${user.email}');

    print('\n--- 🏠 DELIVERY ADDRESS ---');
    final delivery = user.deliveryAddressEntity;
    if (delivery != null) {
      print('ID: ${delivery.id}');
      print('Type: ${delivery.deliveryType}');
      print('Comments: ${delivery.comments}');
      print('Pickup location: ${delivery.pickupLocation}');
      print('Country: ${delivery.country}');
      print('Region: ${delivery.region}');
      print('City: ${delivery.city}');
      print('Postal code: ${delivery.postalCode}');
      print('Address: ${delivery.address}');
    } else {
      print('No delivery address found.');
    }

    print('\n--- 💳 PAYMENT METHOD ---');
    final payment = user.paymentMethodEntity;
    if (payment != null) {
      print('ID: ${payment.id}');
      print('Key: ${payment.key}');
      print('Title: ${payment.titleKey}');
    } else {
      print('No payment method found.');
    }

    print('------------------------------');
    userBox.put(user.toBox);
  }

  @override
  Future<UserBox?> getUser() async {
    final users = userBox.getAll();
    if (users.isEmpty) return null;
    return users.last;
  }

}

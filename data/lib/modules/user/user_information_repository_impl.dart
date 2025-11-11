import 'dart:convert';

import 'package:common/constants/failure_class.dart';
import 'package:common/constants/logger.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/delivery_address_mapper.dart';
import 'package:data/mapper/payment_method_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/modules/user/sources/local/user_local_source.dart';
import 'package:data/modules/user/sources/remote/current_user_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/delivery_address/models/index.dart';
import 'package:domain/modules/payment_method/index.dart';
import 'package:domain/modules/user_information/models/index.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class UserInformationRepositoryImpl implements UserInformationRepository {
  final UserLocalSource userLocalSource;
  final CurrentUserApiService currentUserApiService;

  UserInformationRepositoryImpl({required this.userLocalSource, required this.currentUserApiService});

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
  Stream<UserEntity?> getUser()  {
    final userBox =  userLocalSource.getUser();
    return userBox.map((userBox) => userBox?.toEntity);
  }

  @override
  Future<DeliveryAddressEntity?> getDeliveryAddress() async {
    final deliveryAddress = await userLocalSource.getDeliveryAddress();
    if (deliveryAddress == null) return null;
    return deliveryAddress.toEntity;
  }

  @override
  Future<PaymentMethodEntity?> getPaymentMethod() async {
    final paymentMethod = await userLocalSource.getPaymentMethod();
    if (paymentMethod == null) return null;
    return paymentMethod.toEntity;
  }

  @override
  Future<Either<Failure, UserEntity>> getUserFromApi() async {
    try {
      final response = await currentUserApiService.getUserApi();
      consoleLog('response getUserFromApi() ${response.runtimeType}');
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      consoleLog('ecsad $e');

      if (e is DioException) {
        print('dioExceptionion ${e.stackTrace}');
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }
}

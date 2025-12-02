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
  Future<void> setDeliveryAddress({required int idUser, required DeliveryAddressEntity deliveryAddress}) async {
    await userLocalSource.setDeliveryAddress(idUser: idUser, deliveryAddress: deliveryAddress);
  }

  @override
  Future<void> setPaymentMethod({required int idUser, required PaymentMethodEntity paymentMethod}) async {
    await userLocalSource.setPaymentMethod(idUser: idUser, paymentMethod: paymentMethod);
  }

  @override
  Stream<UserEntity?> getUser(int idUser) {
    return userLocalSource.getUser(idUser).map((userBox) => userBox?.toEntity);
  }

  @override
  Future<DeliveryAddressEntity?> getDeliveryAddress(int idUser) async {
    final deliveryAddress = await userLocalSource.getDeliveryAddress(idUser);
    return deliveryAddress?.toEntity;
  }

  @override
  Future<PaymentMethodEntity?> getPaymentMethod(int idUser) async {
    final paymentMethod = await userLocalSource.getPaymentMethod(idUser);
    return paymentMethod?.toEntity;
  }

  @override
  Future<Either<Failure, UserEntity>> getUserFromApi() async {
    try {
      final response = await currentUserApiService.getUserApi();
      return Right(response.toEntity);
    } catch (e, stackTrace) {
      consoleLog('getUserFromApi error: $e');

      if (e is DioException) {
        consoleLog('DioException stackTrace: ${e.stackTrace}');
        return Left(Failure.dio(e));
      }

      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<void> deleteAllUsers() async {
    userLocalSource.deleteAllUsers();
  }
}

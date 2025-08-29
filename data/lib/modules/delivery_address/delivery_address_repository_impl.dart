import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/cities_response_mapper.dart';
import 'package:data/mapper/countries_mapper.dart';
import 'package:data/mapper/states_mapper.dart';
import 'package:data/modules/delivery_address/models/remote/index.dart';
import 'package:data/modules/delivery_address/sources/remote/delivery_address_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/delivery_address/delivery_address_repository.dart';
import 'package:domain/modules/delivery_address/models/index.dart';

class DeliveryAddressRepositoryImpl implements DeliveryAddressRepository {
  final DeliveryAddressApiService apiService;

  DeliveryAddressRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<CountriesEntity>>> getCountries() async {
    try {
      final response = await apiService.getCountries();
      final entities = response.data.map((dto) => dto.toEntity).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, CitiesResponseEntity>> getCities(country, state) async {
    try {
      final response = await apiService.getCities(country, state);
      final entities = response.map((dto) => dto.toEntity);
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<StatesEntity>>> getStates(String country) async {
    try {
      final response = await apiService.getStates(country);
      final entities = response.data.states.map((dto) => dto.toEntity).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }
}

import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

import 'models/index.dart';

abstract class DeliveryAddressRepository {
  Future<Either<Failure, List<CountriesEntity>>> getCountries();

  Future<Either<Failure, List<StatesEntity>>> getStates(String country);

  Future<Either<Failure, CitiesResponseEntity>> getCities(
    String country,
    String state,
  );
}

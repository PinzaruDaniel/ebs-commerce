import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/countries/models/index.dart';

abstract class CountriesRepository{
  Future<Either<Failure, CountriesEntity>> getCountries();
}
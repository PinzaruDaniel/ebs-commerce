import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/cities/models/index.dart';

abstract class CitiesRepository{
  Future<Either<Failure, CitiesResponseEntity>> getCities(String country, String state);
}
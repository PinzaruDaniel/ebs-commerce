import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/modules/states/models/index.dart';

abstract class StatesRepository{
  Future<Either<Failure, StatesEntity>> getStates(String country);
}
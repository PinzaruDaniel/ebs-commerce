import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type> {  Future<Either<Failure, Type>> call();}

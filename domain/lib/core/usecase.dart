import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}
abstract class UseCaseNoEither<Type, Params>{
  Future<Type> call(Params params);
}
abstract class UseCaseNoEitherNoParams<Type>{
  Future<Type> call();
}

import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
abstract class UseCaseStream<Type, Params>{
  Stream<Type> call(Params params);
}

abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}
abstract class UseCaseNoEither<Type, Params>{
  Future<Type> call(Params params);
}
abstract class UseCaseNoEitherNoParams<Type>{
  Stream<Type> call();
}
abstract class UseCaseNoEitherNoParamsNoStream<Type>{
  Future<Type>call();
}

abstract class UseCaseStreamNullable<Type, Params>{
  Stream<Type?> call(Params params);
}
abstract class UseCaseNoEitherNoStreamNullable<Type, Params>{
  Future<Type?> call(Params params);
}



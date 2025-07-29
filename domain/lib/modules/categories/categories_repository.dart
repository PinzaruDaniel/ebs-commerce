import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'models/index.dart';

abstract class CategoriesRepository{
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}
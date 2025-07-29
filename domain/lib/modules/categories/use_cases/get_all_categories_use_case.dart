import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/core/usecase.dart';
import 'package:domain/modules/categories/categories_repository.dart';
import 'package:domain/modules/categories/models/index.dart';

class GetAllCategoriesUseCase extends UseCase<List<CategoryEntity>>{
  final CategoriesRepository categoriesRepository;

  GetAllCategoriesUseCase({required this.categoriesRepository});
  @override
  Future<Either<Failure, List<CategoryEntity>>> call() {
    return categoriesRepository.getAllCategories();
  }

}
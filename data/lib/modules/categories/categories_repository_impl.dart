import 'package:common/constants/failure_class.dart';
import 'package:dartz/dartz.dart';
import 'package:data/mapper/category_response_mapper.dart';
import 'package:data/modules/categories/models/remote/index.dart';
import 'package:data/modules/categories/sources/remote/categories_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/categories/categories_repository.dart';
import 'package:domain/modules/categories/models/index.dart';


class CategoriesRepositoryImpl implements CategoriesRepository{
  final CategoriesApiService apiService;
  CategoriesRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final response = await apiService.getCategories(266);
      final entities = response.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

}
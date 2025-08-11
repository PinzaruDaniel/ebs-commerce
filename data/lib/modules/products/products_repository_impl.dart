import 'package:common/constants/failure_class.dart';
import 'package:data/mapper/product_response_mapper.dart';
import 'package:data/modules/products/models/remote/index.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService apiService;

  ProductsRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final response = await apiService.getProducts({'per_page': 451});
      final entities = response.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts( page, perPage) async {
    try {
      final response = await apiService.getProducts({'page': page,'per_page': perPage});
      final entities = response.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSaleProducts( page, perPage) async {
    try {
      final response = await apiService.getProducts({'has_discount': true, 'page': page,'per_page': perPage});
      final entities = response.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getNewProducts( page, perPage) async {
    try {
      final response = await apiService.getProducts({'marks': 'new', 'page': page,'per_page': perPage});
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

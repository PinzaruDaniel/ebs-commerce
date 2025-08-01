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
      final response = await apiService.getProducts(null, null, 451);
      final entities = response.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      } else if (e is Exception) {
        return Left(Failure.exception(e, stackTrace));
      } else {
        return Left(Failure.error(e, stackTrace));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await apiService.getProducts(null, null, 20);
      final entities = response.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      } else if (e is Exception) {
        return Left(Failure.exception(e, stackTrace));
      } else {
        return Left(Failure.error(e, stackTrace));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSaleProducts() async {
    try {
      final response = await apiService.getProducts('sale', null, null);
      final entities = response.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      } else if (e is Exception) {
        return Left(Failure.exception(e, stackTrace));
      } else {
        return Left(Failure.error(e, stackTrace));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getNewProducts() async {
    try {
      final response = await apiService.getProducts('new', null, null);
      final entities = response.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      } else if (e is Exception) {
        return Left(Failure.exception(e, stackTrace));
      } else {
        return Left(Failure.error(e, stackTrace));
      }
    }
  }
}

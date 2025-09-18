import 'package:common/constants/failure_class.dart';
import 'package:data/mapper/product_mapper.dart';
import 'package:data/mapper/product_response_mapper.dart';
import 'package:data/modules/products/models/remote/index.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';
import 'package:objectbox/objectbox.dart';

import 'models/local/product_box.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService apiService;
  final Box<ProductBox> productBox;

  ProductsRepositoryImpl( {required this.apiService, required this.productBox,});

  @override
  Future<Either<Failure, ProductResponseEntity>> getFilteredProducts(page, priceGte, priceLte, categoriesId) async {
    try {
      final response = await apiService.getProducts({
        'page': page,
        'price_gte': priceGte,
        'price_lte': priceLte,
        if (categoriesId != null) 'categories': categoriesId,
      });
      final entities = response.map((dto) => dto.toEntity());
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  Stream<List<ProductEntity>> watchProducts(){
    return productBox.query().watch(triggerImmediately: true).map((query)=>query.find().map((e)=>e.toEntity()).toList());
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(page, perPage) async {
    try {
      final response = await apiService.getProducts({'page': page, 'per_page': perPage});
      final entities = response.results.map((dto) => dto.toEntity()).toList();
      productBox.putMany(entities.map((e)=>e.toBox()).toList());
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSaleProducts(page, perPage) async {
    try {
      final response = await apiService.getProducts({'marks': 'sale', 'page': page, 'per_page': perPage});
      final entities = response.results.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getNewProducts(page, perPage) async {
    try {
      final response = await apiService.getProducts({'marks': 'new', 'page': page, 'per_page': perPage});
      final entities = response.results.map((dto) => dto.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }
}

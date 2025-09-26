import 'package:common/constants/failure_class.dart';
import 'package:data/mapper/product_mapper.dart';
import 'package:data/mapper/product_response_mapper.dart';
import 'package:data/modules/products/models/remote/index.dart';
import 'package:dartz/dartz.dart';
import 'package:data/modules/products/sources/local/products_local_source.dart';
import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:domain/modules/products/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService apiService;
  final ProductsLocalDataSource localDataSource;
  ProductsRepositoryImpl({required this.apiService, required this.localDataSource});
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
  @override
  Future<Either<Failure, int>> getFilteredProductsCount(page, priceGte, priceLte, categoriesId) async {
    try {
      final response = await apiService.getProducts({
        'page': page,
        'price_gte': priceGte,
        'price_lte': priceLte,
        if (categoriesId != null) 'categories': categoriesId,
      });
      return Right(response.count);
    } catch (e, stackTrace) {
      if (e is DioException) {
        return Left(Failure.dio(e));
      }
      return Left(Failure.error(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(page, perPage, marks) async {
    try {
      final Map<String, dynamic> queries = {'page': page, 'per_page': perPage, if (marks != null) 'marks': marks};
      final response = await apiService.getProducts(queries);
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
  Future<void> setProductsLocalCache(List<ProductEntity> products) {
    return localDataSource.setProducts(products.map((e)=>e.toBox).toList());
  }

  @override
  Stream<List<ProductEntity>> getProductsLocalCache() {
    return localDataSource.getProducts().map(
          (boxList) => boxList.map((e) => e.toEntity()).toList(),
    );
  }


}

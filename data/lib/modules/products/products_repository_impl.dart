
import 'package:data/modules/products/mapper/product_response_mapper.dart';
import 'package:data/modules/products/models/remote/product_response_api_dto.dart';

import 'package:data/modules/products/sources/remote/products_api_service.dart';
import 'package:domain/modules/products/models/product_entity.dart';
import 'package:domain/modules/products/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService apiService;

  ProductsRepositoryImpl({required this.apiService});

  @override
  Future<List<ProductEntity>> getAllProduct() async {
    try {
      final response = await apiService.getProducts(null, null,null);
      final entities = response.map((dto) => dto.toEntity()).toList();
      return entities;
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<List<ProductEntity>> getSaleProduct() async {
    try{
      final response=await apiService.getProducts('sale', null, null);
      final entities=response.map((dto)=>dto.toEntity()).toList();
      return entities;
    }
    catch (e){
      rethrow;
    }
  }


  @override
  Future<List<ProductEntity>> getNewProduct() async {
    try {
      final response = await apiService.getProducts('new', null, null);
      final entities = response.map((dto) => dto.toEntity()).toList();
      return entities;
    }
    catch (e) {
      rethrow;
    }
  }
}

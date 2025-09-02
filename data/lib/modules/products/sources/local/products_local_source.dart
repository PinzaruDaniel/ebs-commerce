/*
import 'package:data/mapper/product_mapper.dart';
import 'package:domain/modules/products/models/index.dart';
import 'package:objectbox/objectbox.dart';

import '../../models/local/index.dart';

class ProductsLocalDataSource {
  final Box<ProductLocalDto> _box = objectBoxStore.box<ProductLocalDto>();

  Future<void> saveProducts(List<ProductEntity> products) async {
    final dtos = products.map((p) => p.toLocalDto()).toList();
    _box.putMany(dtos);
  }

  Future<List<ProductEntity>> getProducts() async {
    final dtos = _box.getAll();
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  Future<ProductEntity?> getProductById(int id) async {
    final dto = _box.get(id);
    return dto?.toEntity();
  }

  Future<void> deleteProduct(int id) async {
    _box.remove(id);
  }
}*/


import 'package:data/mapper/product_mapper.dart';
import 'package:domain/modules/products/models/index.dart';

import '../modules/products/models/remote/index.dart';

extension ProductResponseMapper on ProductResponseApiDto{
  List<ProductEntity> toEntity(){
    return results.map((dto)=>dto.toEntity()).toList();
  }

}
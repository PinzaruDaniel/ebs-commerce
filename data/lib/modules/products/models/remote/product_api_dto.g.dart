// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductApiDto _$ProductApiDtoFromJson(Map<String, dynamic> json) =>
    _ProductApiDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brandMap: json['brand'] as Map<String, dynamic>?,
      price: json['price'] as String?,
      imageUrl: (json['imageUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      marks: (json['marks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stock: (json['stock'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      description: json['description'] as String?,
      specification: (json['specification'] as List<dynamic>?)
          ?.map((e) => SpecificationApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => CategoryApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductApiDtoToJson(_ProductApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brandMap,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'marks': instance.marks,
      'stock': instance.stock,
      'discount': instance.discount,
      'description': instance.description,
      'specification': instance.specification,
      'category': instance.category,
    };

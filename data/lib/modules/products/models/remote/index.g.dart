// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductApiDto _$ProductApiDtoFromJson(Map<String, dynamic> json) =>
    _ProductApiDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brand: json['brand'] as Map<String, dynamic>?,
      price: json['price'] as String?,
      discount: json['discount_percent'] as String?,
      discountedPrice: json['discounted_price'] as String?,
      imageUrl: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      marks: (json['marks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stock: (json['stock'] as num?)?.toInt(),
      description: json['description'] as String?,
      specification: (json['specification'] as List<dynamic>?)
          ?.map((e) => SpecificationApiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: (json['categories'] as List<dynamic>?)
          ?.map(
            (e) => (e as List<dynamic>)
                .map((e) => CategoryApiDto.fromJson(e as Map<String, dynamic>))
                .toList(),
          )
          .toList(),
    );

Map<String, dynamic> _$ProductApiDtoToJson(_ProductApiDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'price': instance.price,
      'discount_percent': instance.discount,
      'discounted_price': instance.discountedPrice,
      'attachments': instance.imageUrl,
      'marks': instance.marks,
      'stock': instance.stock,
      'description': instance.description,
      'specification': instance.specification,
      'categories': instance.category,
    };

_ProductResponseApiDto _$ProductResponseApiDtoFromJson(
  Map<String, dynamic> json,
) => _ProductResponseApiDto(
  count: (json['count'] as num).toInt(),
  totalPages: (json['total_pages'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => ProductApiDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductResponseApiDtoToJson(
  _ProductResponseApiDto instance,
) => <String, dynamic>{
  'count': instance.count,
  'total_pages': instance.totalPages,
  'per_page': instance.perPage,
  'current_page': instance.currentPage,
  'results': instance.results,
};

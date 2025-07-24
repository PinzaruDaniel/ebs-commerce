// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_api_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductApiDto {

 int get id; String get name;@JsonKey(name: 'brand') Map<String, dynamic>? get brandMap; String? get price; List<String>? get imageUrl; List<String>? get marks; int? get stock;@JsonKey(name: 'discount', defaultValue: 0) int? get discount; String? get description; List<SpecificationApiDto>? get specification; List<CategoryApiDto>? get category;
/// Create a copy of ProductApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductApiDtoCopyWith<ProductApiDto> get copyWith => _$ProductApiDtoCopyWithImpl<ProductApiDto>(this as ProductApiDto, _$identity);

  /// Serializes this ProductApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.brandMap, brandMap)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.imageUrl, imageUrl)&&const DeepCollectionEquality().equals(other.marks, marks)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.specification, specification)&&const DeepCollectionEquality().equals(other.category, category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(brandMap),price,const DeepCollectionEquality().hash(imageUrl),const DeepCollectionEquality().hash(marks),stock,discount,description,const DeepCollectionEquality().hash(specification),const DeepCollectionEquality().hash(category));

@override
String toString() {
  return 'ProductApiDto(id: $id, name: $name, brandMap: $brandMap, price: $price, imageUrl: $imageUrl, marks: $marks, stock: $stock, discount: $discount, description: $description, specification: $specification, category: $category)';
}


}

/// @nodoc
abstract mixin class $ProductApiDtoCopyWith<$Res>  {
  factory $ProductApiDtoCopyWith(ProductApiDto value, $Res Function(ProductApiDto) _then) = _$ProductApiDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'brand') Map<String, dynamic>? brandMap, String? price, List<String>? imageUrl, List<String>? marks, int? stock,@JsonKey(name: 'discount', defaultValue: 0) int? discount, String? description, List<SpecificationApiDto>? specification, List<CategoryApiDto>? category
});




}
/// @nodoc
class _$ProductApiDtoCopyWithImpl<$Res>
    implements $ProductApiDtoCopyWith<$Res> {
  _$ProductApiDtoCopyWithImpl(this._self, this._then);

  final ProductApiDto _self;
  final $Res Function(ProductApiDto) _then;

/// Create a copy of ProductApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? brandMap = freezed,Object? price = freezed,Object? imageUrl = freezed,Object? marks = freezed,Object? stock = freezed,Object? discount = freezed,Object? description = freezed,Object? specification = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brandMap: freezed == brandMap ? _self.brandMap : brandMap // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as List<String>?,marks: freezed == marks ? _self.marks : marks // ignore: cast_nullable_to_non_nullable
as List<String>?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,specification: freezed == specification ? _self.specification : specification // ignore: cast_nullable_to_non_nullable
as List<SpecificationApiDto>?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<CategoryApiDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductApiDto].
extension ProductApiDtoPatterns on ProductApiDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductApiDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductApiDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductApiDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductApiDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'brand')  Map<String, dynamic>? brandMap,  String? price,  List<String>? imageUrl,  List<String>? marks,  int? stock, @JsonKey(name: 'discount', defaultValue: 0)  int? discount,  String? description,  List<SpecificationApiDto>? specification,  List<CategoryApiDto>? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductApiDto() when $default != null:
return $default(_that.id,_that.name,_that.brandMap,_that.price,_that.imageUrl,_that.marks,_that.stock,_that.discount,_that.description,_that.specification,_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'brand')  Map<String, dynamic>? brandMap,  String? price,  List<String>? imageUrl,  List<String>? marks,  int? stock, @JsonKey(name: 'discount', defaultValue: 0)  int? discount,  String? description,  List<SpecificationApiDto>? specification,  List<CategoryApiDto>? category)  $default,) {final _that = this;
switch (_that) {
case _ProductApiDto():
return $default(_that.id,_that.name,_that.brandMap,_that.price,_that.imageUrl,_that.marks,_that.stock,_that.discount,_that.description,_that.specification,_that.category);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'brand')  Map<String, dynamic>? brandMap,  String? price,  List<String>? imageUrl,  List<String>? marks,  int? stock, @JsonKey(name: 'discount', defaultValue: 0)  int? discount,  String? description,  List<SpecificationApiDto>? specification,  List<CategoryApiDto>? category)?  $default,) {final _that = this;
switch (_that) {
case _ProductApiDto() when $default != null:
return $default(_that.id,_that.name,_that.brandMap,_that.price,_that.imageUrl,_that.marks,_that.stock,_that.discount,_that.description,_that.specification,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductApiDto implements ProductApiDto {
  const _ProductApiDto({required this.id, required this.name, @JsonKey(name: 'brand') required final  Map<String, dynamic>? brandMap, required this.price, required final  List<String>? imageUrl, required final  List<String>? marks, required this.stock, @JsonKey(name: 'discount', defaultValue: 0) this.discount, required this.description, required final  List<SpecificationApiDto>? specification, required final  List<CategoryApiDto>? category}): _brandMap = brandMap,_imageUrl = imageUrl,_marks = marks,_specification = specification,_category = category;
  factory _ProductApiDto.fromJson(Map<String, dynamic> json) => _$ProductApiDtoFromJson(json);

@override final  int id;
@override final  String name;
 final  Map<String, dynamic>? _brandMap;
@override@JsonKey(name: 'brand') Map<String, dynamic>? get brandMap {
  final value = _brandMap;
  if (value == null) return null;
  if (_brandMap is EqualUnmodifiableMapView) return _brandMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? price;
 final  List<String>? _imageUrl;
@override List<String>? get imageUrl {
  final value = _imageUrl;
  if (value == null) return null;
  if (_imageUrl is EqualUnmodifiableListView) return _imageUrl;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _marks;
@override List<String>? get marks {
  final value = _marks;
  if (value == null) return null;
  if (_marks is EqualUnmodifiableListView) return _marks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? stock;
@override@JsonKey(name: 'discount', defaultValue: 0) final  int? discount;
@override final  String? description;
 final  List<SpecificationApiDto>? _specification;
@override List<SpecificationApiDto>? get specification {
  final value = _specification;
  if (value == null) return null;
  if (_specification is EqualUnmodifiableListView) return _specification;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CategoryApiDto>? _category;
@override List<CategoryApiDto>? get category {
  final value = _category;
  if (value == null) return null;
  if (_category is EqualUnmodifiableListView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductApiDtoCopyWith<_ProductApiDto> get copyWith => __$ProductApiDtoCopyWithImpl<_ProductApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._brandMap, _brandMap)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other._imageUrl, _imageUrl)&&const DeepCollectionEquality().equals(other._marks, _marks)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._specification, _specification)&&const DeepCollectionEquality().equals(other._category, _category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_brandMap),price,const DeepCollectionEquality().hash(_imageUrl),const DeepCollectionEquality().hash(_marks),stock,discount,description,const DeepCollectionEquality().hash(_specification),const DeepCollectionEquality().hash(_category));

@override
String toString() {
  return 'ProductApiDto(id: $id, name: $name, brandMap: $brandMap, price: $price, imageUrl: $imageUrl, marks: $marks, stock: $stock, discount: $discount, description: $description, specification: $specification, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ProductApiDtoCopyWith<$Res> implements $ProductApiDtoCopyWith<$Res> {
  factory _$ProductApiDtoCopyWith(_ProductApiDto value, $Res Function(_ProductApiDto) _then) = __$ProductApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'brand') Map<String, dynamic>? brandMap, String? price, List<String>? imageUrl, List<String>? marks, int? stock,@JsonKey(name: 'discount', defaultValue: 0) int? discount, String? description, List<SpecificationApiDto>? specification, List<CategoryApiDto>? category
});




}
/// @nodoc
class __$ProductApiDtoCopyWithImpl<$Res>
    implements _$ProductApiDtoCopyWith<$Res> {
  __$ProductApiDtoCopyWithImpl(this._self, this._then);

  final _ProductApiDto _self;
  final $Res Function(_ProductApiDto) _then;

/// Create a copy of ProductApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? brandMap = freezed,Object? price = freezed,Object? imageUrl = freezed,Object? marks = freezed,Object? stock = freezed,Object? discount = freezed,Object? description = freezed,Object? specification = freezed,Object? category = freezed,}) {
  return _then(_ProductApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brandMap: freezed == brandMap ? _self._brandMap : brandMap // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self._imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as List<String>?,marks: freezed == marks ? _self._marks : marks // ignore: cast_nullable_to_non_nullable
as List<String>?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,specification: freezed == specification ? _self._specification : specification // ignore: cast_nullable_to_non_nullable
as List<SpecificationApiDto>?,category: freezed == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<CategoryApiDto>?,
  ));
}


}

// dart format on

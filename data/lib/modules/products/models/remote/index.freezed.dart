// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductApiDto {

 int get id; String get name; Map<String, dynamic>? get brand; String? get price;@JsonKey(name: 'discount_percent', defaultValue: null) String? get discount;@JsonKey(name: 'discounted_price', defaultValue: null) String? get discountedPrice;@JsonKey(name: 'attachments') List<String>? get imageUrl; List<String>? get marks; int? get stock; String? get description; List<SpecificationApiDto>? get specification;@JsonKey(name: 'categories') List<List<CategoryApiDto>>? get category;
/// Create a copy of ProductApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductApiDtoCopyWith<ProductApiDto> get copyWith => _$ProductApiDtoCopyWithImpl<ProductApiDto>(this as ProductApiDto, _$identity);

  /// Serializes this ProductApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.brand, brand)&&(identical(other.price, price) || other.price == price)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&const DeepCollectionEquality().equals(other.imageUrl, imageUrl)&&const DeepCollectionEquality().equals(other.marks, marks)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.specification, specification)&&const DeepCollectionEquality().equals(other.category, category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(brand),price,discount,discountedPrice,const DeepCollectionEquality().hash(imageUrl),const DeepCollectionEquality().hash(marks),stock,description,const DeepCollectionEquality().hash(specification),const DeepCollectionEquality().hash(category));

@override
String toString() {
  return 'ProductApiDto(id: $id, name: $name, brand: $brand, price: $price, discount: $discount, discountedPrice: $discountedPrice, imageUrl: $imageUrl, marks: $marks, stock: $stock, description: $description, specification: $specification, category: $category)';
}


}

/// @nodoc
abstract mixin class $ProductApiDtoCopyWith<$Res>  {
  factory $ProductApiDtoCopyWith(ProductApiDto value, $Res Function(ProductApiDto) _then) = _$ProductApiDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, Map<String, dynamic>? brand, String? price,@JsonKey(name: 'discount_percent', defaultValue: null) String? discount,@JsonKey(name: 'discounted_price', defaultValue: null) String? discountedPrice,@JsonKey(name: 'attachments') List<String>? imageUrl, List<String>? marks, int? stock, String? description, List<SpecificationApiDto>? specification,@JsonKey(name: 'categories') List<List<CategoryApiDto>>? category
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? brand = freezed,Object? price = freezed,Object? discount = freezed,Object? discountedPrice = freezed,Object? imageUrl = freezed,Object? marks = freezed,Object? stock = freezed,Object? description = freezed,Object? specification = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String?,discountedPrice: freezed == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as List<String>?,marks: freezed == marks ? _self.marks : marks // ignore: cast_nullable_to_non_nullable
as List<String>?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,specification: freezed == specification ? _self.specification : specification // ignore: cast_nullable_to_non_nullable
as List<SpecificationApiDto>?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<List<CategoryApiDto>>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  Map<String, dynamic>? brand,  String? price, @JsonKey(name: 'discount_percent', defaultValue: null)  String? discount, @JsonKey(name: 'discounted_price', defaultValue: null)  String? discountedPrice, @JsonKey(name: 'attachments')  List<String>? imageUrl,  List<String>? marks,  int? stock,  String? description,  List<SpecificationApiDto>? specification, @JsonKey(name: 'categories')  List<List<CategoryApiDto>>? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductApiDto() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.price,_that.discount,_that.discountedPrice,_that.imageUrl,_that.marks,_that.stock,_that.description,_that.specification,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  Map<String, dynamic>? brand,  String? price, @JsonKey(name: 'discount_percent', defaultValue: null)  String? discount, @JsonKey(name: 'discounted_price', defaultValue: null)  String? discountedPrice, @JsonKey(name: 'attachments')  List<String>? imageUrl,  List<String>? marks,  int? stock,  String? description,  List<SpecificationApiDto>? specification, @JsonKey(name: 'categories')  List<List<CategoryApiDto>>? category)  $default,) {final _that = this;
switch (_that) {
case _ProductApiDto():
return $default(_that.id,_that.name,_that.brand,_that.price,_that.discount,_that.discountedPrice,_that.imageUrl,_that.marks,_that.stock,_that.description,_that.specification,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  Map<String, dynamic>? brand,  String? price, @JsonKey(name: 'discount_percent', defaultValue: null)  String? discount, @JsonKey(name: 'discounted_price', defaultValue: null)  String? discountedPrice, @JsonKey(name: 'attachments')  List<String>? imageUrl,  List<String>? marks,  int? stock,  String? description,  List<SpecificationApiDto>? specification, @JsonKey(name: 'categories')  List<List<CategoryApiDto>>? category)?  $default,) {final _that = this;
switch (_that) {
case _ProductApiDto() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.price,_that.discount,_that.discountedPrice,_that.imageUrl,_that.marks,_that.stock,_that.description,_that.specification,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductApiDto implements ProductApiDto {
  const _ProductApiDto({required this.id, required this.name, required final  Map<String, dynamic>? brand, required this.price, @JsonKey(name: 'discount_percent', defaultValue: null) this.discount, @JsonKey(name: 'discounted_price', defaultValue: null) this.discountedPrice, @JsonKey(name: 'attachments') required final  List<String>? imageUrl, required final  List<String>? marks, required this.stock, required this.description, required final  List<SpecificationApiDto>? specification, @JsonKey(name: 'categories') required final  List<List<CategoryApiDto>>? category}): _brand = brand,_imageUrl = imageUrl,_marks = marks,_specification = specification,_category = category;
  factory _ProductApiDto.fromJson(Map<String, dynamic> json) => _$ProductApiDtoFromJson(json);

@override final  int id;
@override final  String name;
 final  Map<String, dynamic>? _brand;
@override Map<String, dynamic>? get brand {
  final value = _brand;
  if (value == null) return null;
  if (_brand is EqualUnmodifiableMapView) return _brand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? price;
@override@JsonKey(name: 'discount_percent', defaultValue: null) final  String? discount;
@override@JsonKey(name: 'discounted_price', defaultValue: null) final  String? discountedPrice;
 final  List<String>? _imageUrl;
@override@JsonKey(name: 'attachments') List<String>? get imageUrl {
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
@override final  String? description;
 final  List<SpecificationApiDto>? _specification;
@override List<SpecificationApiDto>? get specification {
  final value = _specification;
  if (value == null) return null;
  if (_specification is EqualUnmodifiableListView) return _specification;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<List<CategoryApiDto>>? _category;
@override@JsonKey(name: 'categories') List<List<CategoryApiDto>>? get category {
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._brand, _brand)&&(identical(other.price, price) || other.price == price)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&const DeepCollectionEquality().equals(other._imageUrl, _imageUrl)&&const DeepCollectionEquality().equals(other._marks, _marks)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._specification, _specification)&&const DeepCollectionEquality().equals(other._category, _category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_brand),price,discount,discountedPrice,const DeepCollectionEquality().hash(_imageUrl),const DeepCollectionEquality().hash(_marks),stock,description,const DeepCollectionEquality().hash(_specification),const DeepCollectionEquality().hash(_category));

@override
String toString() {
  return 'ProductApiDto(id: $id, name: $name, brand: $brand, price: $price, discount: $discount, discountedPrice: $discountedPrice, imageUrl: $imageUrl, marks: $marks, stock: $stock, description: $description, specification: $specification, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ProductApiDtoCopyWith<$Res> implements $ProductApiDtoCopyWith<$Res> {
  factory _$ProductApiDtoCopyWith(_ProductApiDto value, $Res Function(_ProductApiDto) _then) = __$ProductApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, Map<String, dynamic>? brand, String? price,@JsonKey(name: 'discount_percent', defaultValue: null) String? discount,@JsonKey(name: 'discounted_price', defaultValue: null) String? discountedPrice,@JsonKey(name: 'attachments') List<String>? imageUrl, List<String>? marks, int? stock, String? description, List<SpecificationApiDto>? specification,@JsonKey(name: 'categories') List<List<CategoryApiDto>>? category
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? brand = freezed,Object? price = freezed,Object? discount = freezed,Object? discountedPrice = freezed,Object? imageUrl = freezed,Object? marks = freezed,Object? stock = freezed,Object? description = freezed,Object? specification = freezed,Object? category = freezed,}) {
  return _then(_ProductApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self._brand : brand // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String?,discountedPrice: freezed == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self._imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as List<String>?,marks: freezed == marks ? _self._marks : marks // ignore: cast_nullable_to_non_nullable
as List<String>?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,specification: freezed == specification ? _self._specification : specification // ignore: cast_nullable_to_non_nullable
as List<SpecificationApiDto>?,category: freezed == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<List<CategoryApiDto>>?,
  ));
}


}


/// @nodoc
mixin _$ProductResponseApiDto {

 int get count;@JsonKey(name: 'total_pages') int? get totalPages;@JsonKey(name: 'par_page') int? get perPage;@JsonKey(name: 'current_page') int? get currentPage; List<ProductApiDto> get results;
/// Create a copy of ProductResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductResponseApiDtoCopyWith<ProductResponseApiDto> get copyWith => _$ProductResponseApiDtoCopyWithImpl<ProductResponseApiDto>(this as ProductResponseApiDto, _$identity);

  /// Serializes this ProductResponseApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductResponseApiDto&&(identical(other.count, count) || other.count == count)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,totalPages,perPage,currentPage,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'ProductResponseApiDto(count: $count, totalPages: $totalPages, perPage: $perPage, currentPage: $currentPage, results: $results)';
}


}

/// @nodoc
abstract mixin class $ProductResponseApiDtoCopyWith<$Res>  {
  factory $ProductResponseApiDtoCopyWith(ProductResponseApiDto value, $Res Function(ProductResponseApiDto) _then) = _$ProductResponseApiDtoCopyWithImpl;
@useResult
$Res call({
 int count,@JsonKey(name: 'total_pages') int? totalPages,@JsonKey(name: 'par_page') int? perPage,@JsonKey(name: 'current_page') int? currentPage, List<ProductApiDto> results
});




}
/// @nodoc
class _$ProductResponseApiDtoCopyWithImpl<$Res>
    implements $ProductResponseApiDtoCopyWith<$Res> {
  _$ProductResponseApiDtoCopyWithImpl(this._self, this._then);

  final ProductResponseApiDto _self;
  final $Res Function(ProductResponseApiDto) _then;

/// Create a copy of ProductResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? totalPages = freezed,Object? perPage = freezed,Object? currentPage = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ProductApiDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductResponseApiDto].
extension ProductResponseApiDtoPatterns on ProductResponseApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductResponseApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductResponseApiDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductResponseApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductResponseApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductResponseApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count, @JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'par_page')  int? perPage, @JsonKey(name: 'current_page')  int? currentPage,  List<ProductApiDto> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductResponseApiDto() when $default != null:
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count, @JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'par_page')  int? perPage, @JsonKey(name: 'current_page')  int? currentPage,  List<ProductApiDto> results)  $default,) {final _that = this;
switch (_that) {
case _ProductResponseApiDto():
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count, @JsonKey(name: 'total_pages')  int? totalPages, @JsonKey(name: 'par_page')  int? perPage, @JsonKey(name: 'current_page')  int? currentPage,  List<ProductApiDto> results)?  $default,) {final _that = this;
switch (_that) {
case _ProductResponseApiDto() when $default != null:
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductResponseApiDto implements ProductResponseApiDto {
  const _ProductResponseApiDto({required this.count, @JsonKey(name: 'total_pages') required this.totalPages, @JsonKey(name: 'par_page') required this.perPage, @JsonKey(name: 'current_page') required this.currentPage, required final  List<ProductApiDto> results}): _results = results;
  factory _ProductResponseApiDto.fromJson(Map<String, dynamic> json) => _$ProductResponseApiDtoFromJson(json);

@override final  int count;
@override@JsonKey(name: 'total_pages') final  int? totalPages;
@override@JsonKey(name: 'par_page') final  int? perPage;
@override@JsonKey(name: 'current_page') final  int? currentPage;
 final  List<ProductApiDto> _results;
@override List<ProductApiDto> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ProductResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductResponseApiDtoCopyWith<_ProductResponseApiDto> get copyWith => __$ProductResponseApiDtoCopyWithImpl<_ProductResponseApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductResponseApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductResponseApiDto&&(identical(other.count, count) || other.count == count)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,totalPages,perPage,currentPage,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ProductResponseApiDto(count: $count, totalPages: $totalPages, perPage: $perPage, currentPage: $currentPage, results: $results)';
}


}

/// @nodoc
abstract mixin class _$ProductResponseApiDtoCopyWith<$Res> implements $ProductResponseApiDtoCopyWith<$Res> {
  factory _$ProductResponseApiDtoCopyWith(_ProductResponseApiDto value, $Res Function(_ProductResponseApiDto) _then) = __$ProductResponseApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int count,@JsonKey(name: 'total_pages') int? totalPages,@JsonKey(name: 'par_page') int? perPage,@JsonKey(name: 'current_page') int? currentPage, List<ProductApiDto> results
});




}
/// @nodoc
class __$ProductResponseApiDtoCopyWithImpl<$Res>
    implements _$ProductResponseApiDtoCopyWith<$Res> {
  __$ProductResponseApiDtoCopyWithImpl(this._self, this._then);

  final _ProductResponseApiDto _self;
  final $Res Function(_ProductResponseApiDto) _then;

/// Create a copy of ProductResponseApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? totalPages = freezed,Object? perPage = freezed,Object? currentPage = freezed,Object? results = null,}) {
  return _then(_ProductResponseApiDto(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ProductApiDto>,
  ));
}


}

// dart format on

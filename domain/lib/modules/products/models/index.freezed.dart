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
mixin _$ProductResponseEntity {

 int get count; int? get totalPages; int? get perPage; int? get currentPage; List<ProductEntity> get response;
/// Create a copy of ProductResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductResponseEntityCopyWith<ProductResponseEntity> get copyWith => _$ProductResponseEntityCopyWithImpl<ProductResponseEntity>(this as ProductResponseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductResponseEntity&&(identical(other.count, count) || other.count == count)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.response, response));
}


@override
int get hashCode => Object.hash(runtimeType,count,totalPages,perPage,currentPage,const DeepCollectionEquality().hash(response));

@override
String toString() {
  return 'ProductResponseEntity(count: $count, totalPages: $totalPages, perPage: $perPage, currentPage: $currentPage, response: $response)';
}


}

/// @nodoc
abstract mixin class $ProductResponseEntityCopyWith<$Res>  {
  factory $ProductResponseEntityCopyWith(ProductResponseEntity value, $Res Function(ProductResponseEntity) _then) = _$ProductResponseEntityCopyWithImpl;
@useResult
$Res call({
 int count, int? totalPages, int? perPage, int? currentPage, List<ProductEntity> response
});




}
/// @nodoc
class _$ProductResponseEntityCopyWithImpl<$Res>
    implements $ProductResponseEntityCopyWith<$Res> {
  _$ProductResponseEntityCopyWithImpl(this._self, this._then);

  final ProductResponseEntity _self;
  final $Res Function(ProductResponseEntity) _then;

/// Create a copy of ProductResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? totalPages = freezed,Object? perPage = freezed,Object? currentPage = freezed,Object? response = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductResponseEntity].
extension ProductResponseEntityPatterns on ProductResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductResponseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  int? totalPages,  int? perPage,  int? currentPage,  List<ProductEntity> response)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductResponseEntity() when $default != null:
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  int? totalPages,  int? perPage,  int? currentPage,  List<ProductEntity> response)  $default,) {final _that = this;
switch (_that) {
case _ProductResponseEntity():
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.response);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  int? totalPages,  int? perPage,  int? currentPage,  List<ProductEntity> response)?  $default,) {final _that = this;
switch (_that) {
case _ProductResponseEntity() when $default != null:
return $default(_that.count,_that.totalPages,_that.perPage,_that.currentPage,_that.response);case _:
  return null;

}
}

}

/// @nodoc


class _ProductResponseEntity implements ProductResponseEntity {
  const _ProductResponseEntity({required this.count, required this.totalPages, required this.perPage, required this.currentPage, required final  List<ProductEntity> response}): _response = response;
  

@override final  int count;
@override final  int? totalPages;
@override final  int? perPage;
@override final  int? currentPage;
 final  List<ProductEntity> _response;
@override List<ProductEntity> get response {
  if (_response is EqualUnmodifiableListView) return _response;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_response);
}


/// Create a copy of ProductResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductResponseEntityCopyWith<_ProductResponseEntity> get copyWith => __$ProductResponseEntityCopyWithImpl<_ProductResponseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductResponseEntity&&(identical(other.count, count) || other.count == count)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._response, _response));
}


@override
int get hashCode => Object.hash(runtimeType,count,totalPages,perPage,currentPage,const DeepCollectionEquality().hash(_response));

@override
String toString() {
  return 'ProductResponseEntity(count: $count, totalPages: $totalPages, perPage: $perPage, currentPage: $currentPage, response: $response)';
}


}

/// @nodoc
abstract mixin class _$ProductResponseEntityCopyWith<$Res> implements $ProductResponseEntityCopyWith<$Res> {
  factory _$ProductResponseEntityCopyWith(_ProductResponseEntity value, $Res Function(_ProductResponseEntity) _then) = __$ProductResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 int count, int? totalPages, int? perPage, int? currentPage, List<ProductEntity> response
});




}
/// @nodoc
class __$ProductResponseEntityCopyWithImpl<$Res>
    implements _$ProductResponseEntityCopyWith<$Res> {
  __$ProductResponseEntityCopyWithImpl(this._self, this._then);

  final _ProductResponseEntity _self;
  final $Res Function(_ProductResponseEntity) _then;

/// Create a copy of ProductResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? totalPages = freezed,Object? perPage = freezed,Object? currentPage = freezed,Object? response = null,}) {
  return _then(_ProductResponseEntity(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,response: null == response ? _self._response : response // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,
  ));
}


}

/// @nodoc
mixin _$ProductEntity {

 int get id; String get name; Map<String, dynamic>? get brand; String? get price; String? get discount; String? get discountedPrice; List<String>? get imageUrl; List<String>? get marks; int? get stock; String? get description; List<SpecificationEntity>? get specification; List<CategoryEntity>? get category;
/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductEntityCopyWith<ProductEntity> get copyWith => _$ProductEntityCopyWithImpl<ProductEntity>(this as ProductEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.brand, brand)&&(identical(other.price, price) || other.price == price)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&const DeepCollectionEquality().equals(other.imageUrl, imageUrl)&&const DeepCollectionEquality().equals(other.marks, marks)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.specification, specification)&&const DeepCollectionEquality().equals(other.category, category));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(brand),price,discount,discountedPrice,const DeepCollectionEquality().hash(imageUrl),const DeepCollectionEquality().hash(marks),stock,description,const DeepCollectionEquality().hash(specification),const DeepCollectionEquality().hash(category));

@override
String toString() {
  return 'ProductEntity(id: $id, name: $name, brand: $brand, price: $price, discount: $discount, discountedPrice: $discountedPrice, imageUrl: $imageUrl, marks: $marks, stock: $stock, description: $description, specification: $specification, category: $category)';
}


}

/// @nodoc
abstract mixin class $ProductEntityCopyWith<$Res>  {
  factory $ProductEntityCopyWith(ProductEntity value, $Res Function(ProductEntity) _then) = _$ProductEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, Map<String, dynamic>? brand, String? price, String? discount, String? discountedPrice, List<String>? imageUrl, List<String>? marks, int? stock, String? description, List<SpecificationEntity>? specification, List<CategoryEntity>? category
});




}
/// @nodoc
class _$ProductEntityCopyWithImpl<$Res>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._self, this._then);

  final ProductEntity _self;
  final $Res Function(ProductEntity) _then;

/// Create a copy of ProductEntity
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
as List<SpecificationEntity>?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductEntity].
extension ProductEntityPatterns on ProductEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  Map<String, dynamic>? brand,  String? price,  String? discount,  String? discountedPrice,  List<String>? imageUrl,  List<String>? marks,  int? stock,  String? description,  List<SpecificationEntity>? specification,  List<CategoryEntity>? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  Map<String, dynamic>? brand,  String? price,  String? discount,  String? discountedPrice,  List<String>? imageUrl,  List<String>? marks,  int? stock,  String? description,  List<SpecificationEntity>? specification,  List<CategoryEntity>? category)  $default,) {final _that = this;
switch (_that) {
case _ProductEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  Map<String, dynamic>? brand,  String? price,  String? discount,  String? discountedPrice,  List<String>? imageUrl,  List<String>? marks,  int? stock,  String? description,  List<SpecificationEntity>? specification,  List<CategoryEntity>? category)?  $default,) {final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.price,_that.discount,_that.discountedPrice,_that.imageUrl,_that.marks,_that.stock,_that.description,_that.specification,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _ProductEntity implements ProductEntity {
  const _ProductEntity({required this.id, required this.name, required final  Map<String, dynamic>? brand, required this.price, required this.discount, required this.discountedPrice, required final  List<String>? imageUrl, required final  List<String>? marks, required this.stock, required this.description, required final  List<SpecificationEntity>? specification, required final  List<CategoryEntity>? category}): _brand = brand,_imageUrl = imageUrl,_marks = marks,_specification = specification,_category = category;
  

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
@override final  String? discount;
@override final  String? discountedPrice;
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
@override final  String? description;
 final  List<SpecificationEntity>? _specification;
@override List<SpecificationEntity>? get specification {
  final value = _specification;
  if (value == null) return null;
  if (_specification is EqualUnmodifiableListView) return _specification;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CategoryEntity>? _category;
@override List<CategoryEntity>? get category {
  final value = _category;
  if (value == null) return null;
  if (_category is EqualUnmodifiableListView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductEntityCopyWith<_ProductEntity> get copyWith => __$ProductEntityCopyWithImpl<_ProductEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._brand, _brand)&&(identical(other.price, price) || other.price == price)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&const DeepCollectionEquality().equals(other._imageUrl, _imageUrl)&&const DeepCollectionEquality().equals(other._marks, _marks)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._specification, _specification)&&const DeepCollectionEquality().equals(other._category, _category));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_brand),price,discount,discountedPrice,const DeepCollectionEquality().hash(_imageUrl),const DeepCollectionEquality().hash(_marks),stock,description,const DeepCollectionEquality().hash(_specification),const DeepCollectionEquality().hash(_category));

@override
String toString() {
  return 'ProductEntity(id: $id, name: $name, brand: $brand, price: $price, discount: $discount, discountedPrice: $discountedPrice, imageUrl: $imageUrl, marks: $marks, stock: $stock, description: $description, specification: $specification, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ProductEntityCopyWith<$Res> implements $ProductEntityCopyWith<$Res> {
  factory _$ProductEntityCopyWith(_ProductEntity value, $Res Function(_ProductEntity) _then) = __$ProductEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, Map<String, dynamic>? brand, String? price, String? discount, String? discountedPrice, List<String>? imageUrl, List<String>? marks, int? stock, String? description, List<SpecificationEntity>? specification, List<CategoryEntity>? category
});




}
/// @nodoc
class __$ProductEntityCopyWithImpl<$Res>
    implements _$ProductEntityCopyWith<$Res> {
  __$ProductEntityCopyWithImpl(this._self, this._then);

  final _ProductEntity _self;
  final $Res Function(_ProductEntity) _then;

/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? brand = freezed,Object? price = freezed,Object? discount = freezed,Object? discountedPrice = freezed,Object? imageUrl = freezed,Object? marks = freezed,Object? stock = freezed,Object? description = freezed,Object? specification = freezed,Object? category = freezed,}) {
  return _then(_ProductEntity(
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
as List<SpecificationEntity>?,category: freezed == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>?,
  ));
}


}

// dart format on

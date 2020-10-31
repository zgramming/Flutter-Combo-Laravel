// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
class _$ProductModelTearOff {
  const _$ProductModelTearOff();

// ignore: unused_element
  _ProductModel call(
      {int idProduct,
      String name,
      double price,
      int stock,
      String summary,
      String description,
      String imageProduct,
      DateTime createdAt,
      DateTime updatedAt}) {
    return _ProductModel(
      idProduct: idProduct,
      name: name,
      price: price,
      stock: stock,
      summary: summary,
      description: description,
      imageProduct: imageProduct,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

// ignore: unused_element
  ProductModel fromJson(Map<String, Object> json) {
    return ProductModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProductModel = _$ProductModelTearOff();

/// @nodoc
mixin _$ProductModel {
  int get idProduct;
  String get name;
  double get price;
  int get stock;
  String get summary;
  String get description;
  String get imageProduct;
  DateTime get createdAt;
  DateTime get updatedAt;

  Map<String, dynamic> toJson();
  $ProductModelCopyWith<ProductModel> get copyWith;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res>;
  $Res call(
      {int idProduct,
      String name,
      double price,
      int stock,
      String summary,
      String description,
      String imageProduct,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  final ProductModel _value;
  // ignore: unused_field
  final $Res Function(ProductModel) _then;

  @override
  $Res call({
    Object idProduct = freezed,
    Object name = freezed,
    Object price = freezed,
    Object stock = freezed,
    Object summary = freezed,
    Object description = freezed,
    Object imageProduct = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      idProduct: idProduct == freezed ? _value.idProduct : idProduct as int,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
      stock: stock == freezed ? _value.stock : stock as int,
      summary: summary == freezed ? _value.summary : summary as String,
      description:
          description == freezed ? _value.description : description as String,
      imageProduct: imageProduct == freezed
          ? _value.imageProduct
          : imageProduct as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) then) =
      __$ProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idProduct,
      String name,
      double price,
      int stock,
      String summary,
      String description,
      String imageProduct,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res> extends _$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(
      _ProductModel _value, $Res Function(_ProductModel) _then)
      : super(_value, (v) => _then(v as _ProductModel));

  @override
  _ProductModel get _value => super._value as _ProductModel;

  @override
  $Res call({
    Object idProduct = freezed,
    Object name = freezed,
    Object price = freezed,
    Object stock = freezed,
    Object summary = freezed,
    Object description = freezed,
    Object imageProduct = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_ProductModel(
      idProduct: idProduct == freezed ? _value.idProduct : idProduct as int,
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
      stock: stock == freezed ? _value.stock : stock as int,
      summary: summary == freezed ? _value.summary : summary as String,
      description:
          description == freezed ? _value.description : description as String,
      imageProduct: imageProduct == freezed
          ? _value.imageProduct
          : imageProduct as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_ProductModel implements _ProductModel {
  _$_ProductModel(
      {this.idProduct,
      this.name,
      this.price,
      this.stock,
      this.summary,
      this.description,
      this.imageProduct,
      this.createdAt,
      this.updatedAt});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductModelFromJson(json);

  @override
  final int idProduct;
  @override
  final String name;
  @override
  final double price;
  @override
  final int stock;
  @override
  final String summary;
  @override
  final String description;
  @override
  final String imageProduct;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProductModel(idProduct: $idProduct, name: $name, price: $price, stock: $stock, summary: $summary, description: $description, imageProduct: $imageProduct, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductModel &&
            (identical(other.idProduct, idProduct) ||
                const DeepCollectionEquality()
                    .equals(other.idProduct, idProduct)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.stock, stock) ||
                const DeepCollectionEquality().equals(other.stock, stock)) &&
            (identical(other.summary, summary) ||
                const DeepCollectionEquality()
                    .equals(other.summary, summary)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageProduct, imageProduct) ||
                const DeepCollectionEquality()
                    .equals(other.imageProduct, imageProduct)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idProduct) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(stock) ^
      const DeepCollectionEquality().hash(summary) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageProduct) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @override
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductModelToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {int idProduct,
      String name,
      double price,
      int stock,
      String summary,
      String description,
      String imageProduct,
      DateTime createdAt,
      DateTime updatedAt}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  int get idProduct;
  @override
  String get name;
  @override
  double get price;
  @override
  int get stock;
  @override
  String get summary;
  @override
  String get description;
  @override
  String get imageProduct;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  _$ProductModelCopyWith<_ProductModel> get copyWith;
}

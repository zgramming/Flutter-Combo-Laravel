// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_ProductModel _$_$_ProductModelFromJson(Map<String, dynamic> json) {
  return _$_ProductModel(
    idProduct: json['id_product'] as int,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    stock: json['stock'] as int,
    summary: json['summary'] as String,
    description: json['description'] as String,
    imageProduct: json['image_product'] as String,
    createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_ProductModelToJson(_$_ProductModel instance) => <String, dynamic>{
      'id_product': instance.idProduct,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'summary': instance.summary,
      'description': instance.description,
      'image_product': instance.imageProduct,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

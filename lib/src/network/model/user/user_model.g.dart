// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_UserModel _$_$_UserModelFromJson(Map<String, dynamic> json) {
  return _$_UserModel(
    idUser: json['id_user'] as int,
    nameUser: json['name_user'] as String,
    passwordUser: json['password_user'] as String,
    emailUser: json['email_user'] as String,
    imageUser: json['image_user'] as String,
    statusUser: json['status_user'] as int,
    createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_UserModelToJson(_$_UserModel instance) => <String, dynamic>{
      'id_user': instance.idUser,
      'name_user': instance.nameUser,
      'password_user': instance.passwordUser,
      'email_user': instance.emailUser,
      'image_user': instance.imageUser,
      'status_user': instance.statusUser,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

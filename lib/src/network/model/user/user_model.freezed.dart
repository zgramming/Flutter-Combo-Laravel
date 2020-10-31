// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

// ignore: unused_element
  _UserModel call(
      {int idUser,
      String nameUser,
      String passwordUser,
      String emailUser,
      String imageUser,
      String statusUser,
      DateTime createdAt,
      DateTime updatedAt}) {
    return _UserModel(
      idUser: idUser,
      nameUser: nameUser,
      passwordUser: passwordUser,
      emailUser: emailUser,
      imageUser: imageUser,
      statusUser: statusUser,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

// ignore: unused_element
  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  int get idUser;
  String get nameUser;
  String get passwordUser;
  String get emailUser;
  String get imageUser;
  String get statusUser;
  DateTime get createdAt;
  DateTime get updatedAt;

  Map<String, dynamic> toJson();
  $UserModelCopyWith<UserModel> get copyWith;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {int idUser,
      String nameUser,
      String passwordUser,
      String emailUser,
      String imageUser,
      String statusUser,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object idUser = freezed,
    Object nameUser = freezed,
    Object passwordUser = freezed,
    Object emailUser = freezed,
    Object imageUser = freezed,
    Object statusUser = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      idUser: idUser == freezed ? _value.idUser : idUser as int,
      nameUser: nameUser == freezed ? _value.nameUser : nameUser as String,
      passwordUser: passwordUser == freezed
          ? _value.passwordUser
          : passwordUser as String,
      emailUser: emailUser == freezed ? _value.emailUser : emailUser as String,
      imageUser: imageUser == freezed ? _value.imageUser : imageUser as String,
      statusUser:
          statusUser == freezed ? _value.statusUser : statusUser as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idUser,
      String nameUser,
      String passwordUser,
      String emailUser,
      String imageUser,
      String statusUser,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object idUser = freezed,
    Object nameUser = freezed,
    Object passwordUser = freezed,
    Object emailUser = freezed,
    Object imageUser = freezed,
    Object statusUser = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_UserModel(
      idUser: idUser == freezed ? _value.idUser : idUser as int,
      nameUser: nameUser == freezed ? _value.nameUser : nameUser as String,
      passwordUser: passwordUser == freezed
          ? _value.passwordUser
          : passwordUser as String,
      emailUser: emailUser == freezed ? _value.emailUser : emailUser as String,
      imageUser: imageUser == freezed ? _value.imageUser : imageUser as String,
      statusUser:
          statusUser == freezed ? _value.statusUser : statusUser as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {this.idUser,
      this.nameUser,
      this.passwordUser,
      this.emailUser,
      this.imageUser,
      this.statusUser,
      this.createdAt,
      this.updatedAt});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

  @override
  final int idUser;
  @override
  final String nameUser;
  @override
  final String passwordUser;
  @override
  final String emailUser;
  @override
  final String imageUser;
  @override
  final String statusUser;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserModel(idUser: $idUser, nameUser: $nameUser, passwordUser: $passwordUser, emailUser: $emailUser, imageUser: $imageUser, statusUser: $statusUser, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.idUser, idUser) ||
                const DeepCollectionEquality().equals(other.idUser, idUser)) &&
            (identical(other.nameUser, nameUser) ||
                const DeepCollectionEquality()
                    .equals(other.nameUser, nameUser)) &&
            (identical(other.passwordUser, passwordUser) ||
                const DeepCollectionEquality()
                    .equals(other.passwordUser, passwordUser)) &&
            (identical(other.emailUser, emailUser) ||
                const DeepCollectionEquality()
                    .equals(other.emailUser, emailUser)) &&
            (identical(other.imageUser, imageUser) ||
                const DeepCollectionEquality()
                    .equals(other.imageUser, imageUser)) &&
            (identical(other.statusUser, statusUser) ||
                const DeepCollectionEquality()
                    .equals(other.statusUser, statusUser)) &&
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
      const DeepCollectionEquality().hash(idUser) ^
      const DeepCollectionEquality().hash(nameUser) ^
      const DeepCollectionEquality().hash(passwordUser) ^
      const DeepCollectionEquality().hash(emailUser) ^
      const DeepCollectionEquality().hash(imageUser) ^
      const DeepCollectionEquality().hash(statusUser) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {int idUser,
      String nameUser,
      String passwordUser,
      String emailUser,
      String imageUser,
      String statusUser,
      DateTime createdAt,
      DateTime updatedAt}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  int get idUser;
  @override
  String get nameUser;
  @override
  String get passwordUser;
  @override
  String get emailUser;
  @override
  String get imageUser;
  @override
  String get statusUser;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  _$UserModelCopyWith<_UserModel> get copyWith;
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/api/apis.dart';
import '../../network/model/models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends StateNotifier<UserModel> {
  UserProvider([UserModel state]) : super(UserModel());

  static const _userSPKey = 'userKey';
  final _userAPI = UsersApi();

  Future<UserModel> login(String emailUser, String passwordUser) async {
    final result = await _userAPI.login(emailUser, passwordUser);
    return result;
  }

  Future<String> register({
    @required String nameUser,
    @required String emailUser,
    @required String passwordUser,
    @required String passwordConfirmation,
  }) async {
    final result = await _userAPI.register(
      nameUser: nameUser,
      emailUser: emailUser,
      passwordUser: passwordUser,
      passwordConfirmation: passwordConfirmation,
    );
    return result;
  }

  Future<String> updateImage(int idUser, {@required String image}) async {
    final result = await _userAPI.updateImage(idUser, image: image);
    final UserModel user = result['user'];
    final String message = result['message'];
    await saveSessionUser(user);
    return message;
  }

  Future<void> saveSessionUser(UserModel user) async {
    final sp = await SharedPreferences.getInstance();
    final result = await sp.setString(_userSPKey, json.encode(user));
    debugPrint('Save user SharedPreferences : $result');
    state = user;
  }

  Future<void> readSessionUser() async {
    final sp = await SharedPreferences.getInstance();
    final getEncodeSession = sp.getString(_userSPKey);
    if (getEncodeSession == null) {
      return;
    }
    final Map<String, dynamic> decodeUser = json.decode(getEncodeSession);
    final user = UserModel.fromJson(decodeUser);
    debugPrint('Read User SharedPreferences $user');

    state = user;
  }

  Future<void> deleteSessionUser() async {
    final sp = await SharedPreferences.getInstance();
    final result = await sp.remove(_userSPKey);
    debugPrint('Delete Session User $result');
    state = UserModel();
    debugPrint('delete session $state');
  }
}

final userProvider = StateNotifierProvider((ref) => UserProvider());

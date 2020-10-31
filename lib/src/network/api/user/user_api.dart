import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:global_template/global_template.dart';
import 'package:http/http.dart' as http;

import '../../model/models.dart';

class UsersApi {
  Future<UserModel> login(String emailUser, String passwordUser) async {
    final UserModel result = await reusableRequestServer.requestServer(
      () async {
        final response = await http.post(
          appConfig.baseAPIURL + '/' + 'user/login',
          headers: appConfig.headersAPI,
          body: {
            'email_user': '$emailUser',
            'password_user': '$passwordUser',
          },
        );

        final Map<String, dynamic> responseJSON = json.decode(response.body);

        if (responseJSON['status'] == "ok") {
          final Map<String, dynamic> userData = responseJSON['data'];
          var user = UserModel.fromJson(userData);
          return user;
        } else {
          throw responseJSON['message'];
        }
      },
    );
    return result;
  }

  Future<String> register({
    @required String nameUser,
    @required String emailUser,
    @required String passwordUser,
    @required String passwordConfirmation,
  }) async {
    final String result = await reusableRequestServer.requestServer(() async {
      final response = await http
          .post(appConfig.baseAPIURL + '/' + 'user/register', headers: appConfig.headersAPI, body: {
        'name_user': '$nameUser',
        'email_user': '$emailUser',
        'password_user': '$passwordUser',
        'password_confirmation': '$passwordConfirmation',
      });
      log('${response.body}');

      final responseJSON = json.decode(response.body);

      if (responseJSON['status'] == "ok") {
        return responseJSON['message'];
      } else {
        throw responseJSON['message'];
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> updateImage(int idUser, {@required String image}) async {
    final Map<String, dynamic> result = await reusableRequestServer.requestServer(() async {
      final response = await http.put(
        appConfig.baseAPIURL + '/' + 'user/updateImage/$idUser',
        headers: appConfig.headersAPI,
        body: {
          "image_user": "$image",
        },
      );
      final responseJson = json.decode(response.body);
      final message = responseJson['message'];
      if (responseJson['status'] == "ok") {
        final Map<String, dynamic> data = responseJson['data'];
        final user = UserModel.fromJson(data);
        var map = {
          "user": user,
          "message": message,
        };
        return map;
      } else {
        throw message;
      }
    });
    return result;
  }
}

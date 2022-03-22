import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/constants/api.routes.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/core/utils/database.helper.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class AuthService implements IAuthInterface {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  final dbHelper = DatabaseHelper.instance;

  @override
  Future signIn({required userName, required password}) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": false,
    };

    try {
      var uri = Uri.https(ApiRoutes.auth, 'auth/api/v1/auth/login');

      Response response = await _dio.postUri(
        uri,
        data: {
          'Username': userName,
          'Password': password,
        },
      );

      print(userName);
      print(password);
      inspect(response);

      if (response.statusCode == 200) {
        var body = response.data;
        var authResult = body['data']['cognito']['authenticationResult'];

        Map<String, dynamic> row = {
          'accessToken': authResult['accessToken'],
          'refreshToken': authResult['refreshToken'],
          'idToken': authResult['idToken']
        };

        await dbHelper.upsertToken(row);

        List<Service> services = body['data']['services'].map<Service>(
          (dynamic item) {
            return Service.fromJson(item);
          },
        ).toList();

        return services;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}

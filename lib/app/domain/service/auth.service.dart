import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/constants/api.routes.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/core/utils/database.helper.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class AuthService implements IAuth {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  final dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Service>> signIn({required userName, required password}) async {
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
      inspect(e);
      rethrow;
    }
  }

  @override
  Future<bool> refreshExpiredToken() async {
    final tempDio = Dio();

    tempDio.options.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    };

    final result = await dbHelper.queryTokenTable();

    try {
      var uri = Uri.https(ApiRoutes.auth, '/api/auth/refresh-token');

      Response response = await tempDio.postUri(
        uri,
        data: {
          'accessToken': result.first['accessToken'],
          'refreshToken': result.first['refreshToken'],
        },
      );

      if (response.statusCode == 200) {
        var body = response.data;

        Map<String, dynamic> row = {
          'accessToken': body["accessToken"],
          'refreshToken': body["refreshToken"]
        };

        await dbHelper.upsertToken(row);

        return true;
      } else {
        throw false;
      }
    } catch (e) {
      return false;
    }
  }
}

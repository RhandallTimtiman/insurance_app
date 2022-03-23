import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/constants/api.routes.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/core/utils/database.helper.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class ProfileService implements IProfile {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  final dbHelper = DatabaseHelper.instance;

  @override
  Future getProfileDetails({required serviceId}) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": true,
    };

    try {
      var path = '/clients/api/v1/profile/service/$serviceId';

      var uri = Uri.https(
        ApiRoutes.client,
        path,
      );

      Response response = await _dio.getUri(uri);

      inspect(response);

      if (response.statusCode == 200) {
        var body = response.data;

        var temp = body["data"]["profile"]["company"];

        var company = Company.fromJson(temp);

        inspect(company);

        return company;
      } else {
        return Company();
      }
    } catch (e) {
      rethrow;
    }
  }
}

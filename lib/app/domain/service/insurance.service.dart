import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/constants/api.routes.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class InsuranceService implements IInsurance {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  @override
  Future<List<InsuranceProvider>> getRecommendedInsurance({
    required containers,
    countryCode = 'PH',
  }) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": true,
    };

    try {
      var path =
          '/otm/api/v1/transactions/insurance/container-insurance/recommendation';

      var uri = Uri.https(ApiRoutes.transaction, path, {
        'countryCode': countryCode,
      });

      Response response = await _dio.postUri(uri, data: jsonEncode(containers));

      if (response.statusCode == 200) {
        var body = response.data;

        List<InsuranceProvider> insuranceProvider =
            body["data"].map<InsuranceProvider>((dynamic item) {
          return InsuranceProvider.fromJson(item);
        }).toList();

        return insuranceProvider;
      } else {
        return [];
      }
    } catch (e) {
      inspect(e);
      rethrow;
    }
  }
}

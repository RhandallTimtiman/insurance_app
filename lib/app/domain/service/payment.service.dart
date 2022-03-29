import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/constants/api.routes.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class PaymentService implements IPayment {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  @override
  Future<List<PaymentProvider>> getListOfPaymentProvider({
    countryCode = "PH",
    currencyCode = "PHP",
  }) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": true,
    };

    try {
      var path =
          '/otm/api/v1/finance/payment-options/$countryCode/$currencyCode';

      var uri = Uri.https(ApiRoutes.transaction, path);

      Response response = await _dio.getUri(uri);

      if (response.statusCode == 200) {
        var body = response.data;

        List<PaymentProvider> paymentProviders = body["data"]
                ["onlinePaymentOptions"]
            .map<PaymentProvider>((dynamic item) {
          return PaymentProvider.fromJson(item);
        }).toList();

        return paymentProviders;
      } else {
        return [];
      }
    } catch (e) {
      inspect(e);
      rethrow;
    }
  }

  @override
  Future<ComputedRates> computeCpfRates({payload}) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": true,
    };

    try {
      var path = '/otm/api/v1/finance/payment/cpf/compute';

      var uri = Uri.https(ApiRoutes.transaction, path);

      Response response = await _dio.postUri(uri, data: jsonEncode(payload));

      if (response.statusCode == 200) {
        var body = response.data;

        inspect(body);

        var computedRates = ComputedRates.fromJson(body['data']);

        return computedRates;
      } else {
        return ComputedRates();
      }
    } catch (e) {
      inspect(e);
      rethrow;
    }
  }

  @override
  Future submitInsuranceTransaction({payload, serviceRoleId}) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": true,
      "x-service-role": serviceRoleId,
    };
    try {
      var path = '/otm/api/v1/transactions/insurance/container-insurance';

      var uri = Uri.https(ApiRoutes.transaction, path);

      Response response = await _dio.postUri(uri, data: jsonDecode(payload));

      if (response.statusCode == 200) {
        var body = response.data;
        return body;
      }
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/constants/api.routes.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/core/utils/database.helper.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class ReservationService implements IReservation {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  final dbHelper = DatabaseHelper.instance;

  @override
  Future<ResponseReservation> getReservationList({
    required bookingPartyId,
    required query,
    int pageNumber = 1,
    int pageSize = 10,
    int timezoneOffset = 8,
  }) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": true,
    };

    try {
      Map<String, dynamic> queryParams = {
        "query": query,
        "pageNumber": pageNumber.toString(),
        "pageSize": pageSize.toString(),
        "timezoneOffset": timezoneOffset.toString(),
      };

      var path = '/otm/api/v1/transactions/booking-party/$bookingPartyId';

      var uri = Uri.https(
        ApiRoutes.transaction,
        path,
        queryParams,
      );

      Response response = await _dio.getUri(uri);

      if (response.statusCode == 200) {
        var body = response.data;

        // List<Reservation> reservations = body['data'].map<Reservation>(
        //   (dynamic item) {
        //     return Reservation.fromJson(item);
        //   },
        // ).toList();
        ResponseReservation responseReservation =
            ResponseReservation.fromJson(body);
        return responseReservation;
      } else {
        return ResponseReservation(data: [], totalPage: 1, currentPage: 1);
      }
    } catch (e) {
      inspect(e);
      rethrow;
    }
  }

  @override
  Future<ReservationDetails> getReservationDetails(
      {required reservationId}) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": true,
    };

    try {
      var path = '/otm/api/v1/transactions/sea-freight/$reservationId';

      var uri = Uri.https(
        ApiRoutes.transaction,
        path,
      );

      Response response = await _dio.getUri(uri);

      if (response.statusCode == 200) {
        var body = response.data;

        var reservationDetails = ReservationDetails.fromJson(body['data']);

        return reservationDetails;
      } else {
        return ReservationDetails();
      }
    } catch (e) {
      inspect(e);
      rethrow;
    }
  }
}

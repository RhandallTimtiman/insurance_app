import 'package:insurance_app/app/domain/model/models.dart';

class ResponseReservation {
  int currentPage = 1;
  List<Reservation> data = [];
  late int totalPage;

  ResponseReservation({
    required this.currentPage,
    required this.data,
    required this.totalPage,
  });

  ResponseReservation.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    data = <Reservation>[];
    json['data'].forEach((v) {
      data.add(new Reservation.fromJson(v));
    });
    totalPage = json['totalPages'];
  }
}

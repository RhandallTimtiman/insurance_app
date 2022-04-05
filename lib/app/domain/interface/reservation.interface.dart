import 'package:insurance_app/app/domain/model/models.dart';

abstract class IReservation {
  Future<ResponseReservation> getReservationList({
    required bookingPartyId,
    required query,
    int pageNumber = 1,
    int pageSize = 10,
    int timezoneOffset = 8,
  });

  Future<ReservationDetails> getReservationDetails({
    required reservationId,
  });
}

import 'package:insurance_app/app/domain/model/models.dart';

abstract class IReservation {
  Future<List<Reservation>> getReservationList({
    required bookingPartyId,
    String query = 'serviceType:inbound',
    int pageNumber = 1,
    int pageSize = 10,
    int timezoneOffset = 8,
  });

  Future<ReservationDetails> getReservationDetails({
    required reservationId,
  });
}

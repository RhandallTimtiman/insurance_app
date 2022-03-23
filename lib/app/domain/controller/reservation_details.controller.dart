import 'package:get/get.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class ReservationDetailsController extends GetxController {
  final IReservation _reservationService = ReservationService();

  final reservationDetails = ReservationDetails().obs;

  RxString reservationId = ''.obs;

  RxBool isLoading = true.obs;

  setReservationDetails(value) {
    reservationDetails.value = value;
    update();
  }

  setReservationId(value) {
    reservationId.value = value;
    update();
  }

  setIsLoading(value) {
    isLoading.value = value;
    update();
  }

  getReservationDetails() {
    setIsLoading(true);
    _reservationService
        .getReservationDetails(reservationId: reservationId.value)
        .then((result) {
      setIsLoading(false);
      setReservationDetails(result);
    }).catchError((e) {
      setIsLoading(false);
    });
  }
}

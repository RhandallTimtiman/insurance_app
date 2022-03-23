import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class ReservationController extends GetxController {
  final IReservation _reservationService = ReservationService();

  final reservations = <Reservation>[].obs;

  RxBool isLoading = true.obs;
  RxBool isNextPageLoading = false.obs;

  RxInt currentPage = 1.obs;

  setListOfReservation(value) {
    reservations.value = value;
    update();
  }

  addNewReservations(value) {
    reservations.addAll(value);
    update();
  }

  setIsLoading(value) {
    isLoading.value = value;
    update();
  }

  setIsNextPageLoading(value) {
    isNextPageLoading.value = value;
    update();
  }

  setNextPage() async {
    currentPage.value = currentPage.value + 1;
    update();
    await getNextListOfReservation(pageNumber: currentPage.value);
  }

  Future<void> getListOfReservation({
    query = 'serviceType:inbound',
    pageNumber = 1,
    pageSize = 10,
    timezoneOffset = 8,
  }) async {
    setIsLoading(true);

    _reservationService
        .getReservationList(
      bookingPartyId: Get.find<ProfileController>().company.value.companyId,
    )
        .then((result) {
      setListOfReservation(result);
      setIsLoading(false);
    }).catchError((e) {
      setIsLoading(false);
      Get.snackbar(
        'Error',
        'Please contact your administrator!',
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: const Duration(
          seconds: 2,
        ),
      );
    });
  }

  Future<void> getNextListOfReservation({
    query = 'serviceType:inbound',
    pageNumber = 1,
    pageSize = 10,
    timezoneOffset = 8,
  }) async {
    setIsNextPageLoading(true);

    _reservationService
        .getReservationList(
      bookingPartyId: Get.find<ProfileController>().company.value.companyId,
      pageNumber: pageNumber,
    )
        .then((result) {
      addNewReservations(result);
      setIsNextPageLoading(false);
    }).catchError((e) {
      setIsNextPageLoading(false);
      Get.snackbar(
        'Error',
        'Please contact your administrator!',
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: const Duration(
          seconds: 2,
        ),
      );
    });
  }
}

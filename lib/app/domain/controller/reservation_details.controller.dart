import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
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
      inspect(result);
      setIsLoading(false);
      setReservationDetails(result);
    }).catchError((e) {
      setIsLoading(false);
    });
  }

  summarizeContainers() {
    var tempContainers =
        List.from(reservationDetails.value.containers!.map((e) => e).toList());
    var tempContainerInsuranceNotBooked = List.from(reservationDetails
        .value.containerInsuranceNotBookedContainer!
        .map((e) => e)
        .toList());

    var toMappedContainer = tempContainerInsuranceNotBooked.isNotEmpty
        ? tempContainerInsuranceNotBooked
        : tempContainers;

    List<dynamic> tempContainerHolder = [];
    List<dynamic> noDupes = [];

    for (ContainerDetails container in toMappedContainer) {
      tempContainerHolder.add({
        "containerSizeGuid": container.sizeId,
        "containerSizeName": container.size,
        "containerTypeGuid": container.typeId,
        "containerTypeName": container.type,
        "qty": 1,
      });
    }

    for (var container in tempContainerHolder) {
      var item = noDupes.singleWhere(
        (i) =>
            i["containerSizeGuid"] == container["containerSizeGuid"] &&
            i["containerTypeGuid"] == container["containerTypeGuid"],
        orElse: () {
          return null;
        },
      );

      if (item != null) {
        item["qty"] += container["qty"];
        continue;
      }

      noDupes.add(container);
    }

    Get.find<InsuranceController>().setInsuredContainer(noDupes);
    Get.toNamed('/insurance-options');
  }

  Widget showButton() {
    if (!isLoading.value) {
      List<ContainerDetails> tempContainers = List.from(
          reservationDetails.value.containers!.map((e) => e).toList());

      var tempContainerInsuranceNotBooked = List.from(reservationDetails
          .value.containerInsuranceNotBookedContainer!
          .map((e) => e)
          .toList());
      if (tempContainers.isNotEmpty && tempContainers[0].ownership == "COC") {
        if (reservationDetails.value.containerInsuranceTicket!.isNotEmpty) {
          if (tempContainerInsuranceNotBooked.isNotEmpty) {
            return actionButton();
          }
        } else {
          return actionButton();
        }
      }
    }
    return const SizedBox.shrink();
  }

  Widget actionButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(
            2,
            39,
            108,
            1,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Row(
        children: const [
          Text(
            'Avail Insurance',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
          ),
        ],
      ),
      onPressed: () {
        summarizeContainers();
      },
    );
  }
}

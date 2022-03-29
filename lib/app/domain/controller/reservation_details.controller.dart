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
}

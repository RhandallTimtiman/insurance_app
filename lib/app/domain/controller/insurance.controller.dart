import 'dart:developer';

import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class InsuranceController extends GetxController {
  final IInsurance _insuranceService = InsuranceService();

  final insuredContainer = <dynamic>[].obs;

  final insuranceProviders = <InsuranceProvider>[].obs;

  final selectedInsuranceProvider = InsuranceProvider().obs;

  final containerDisplays = <ContainerDisplay>[].obs;

  RxBool isLoading = true.obs;

  setInsuredContainer(value) {
    insuredContainer.value = value;
    update();
  }

  setInsuranceProviders(value) {
    insuranceProviders.value = value;
    update();
  }

  setIsLoading(value) {
    isLoading.value = value;
    update();
  }

  setSelectedInsuranceProvider(value) {
    selectedInsuranceProvider.value = value;
    update();
  }

  setContainerDisplays(value) {
    containerDisplays.value = value;
    update();
  }

  getRecommendedInsurance() {
    setIsLoading(true);

    _insuranceService
        .getRecommendedInsurance(containers: insuredContainer)
        .then((result) {
      setIsLoading(false);
      inspect(result);
      setInsuranceProviders(result);
    }).catchError((e) {
      setIsLoading(false);
    });
  }

  processContainerSummary() {
    var tempContainerRateList = selectedInsuranceProvider
        .value.containerRateList!.containerRates!
        .map((e) => e)
        .toList();

    List<ContainerDisplay> containerSummaryList = [];

    var tempContainerInsuranceNotBooked = List.from(
        Get.find<ReservationDetailsController>()
            .reservationDetails
            .value
            .containerInsuranceNotBookedContainer!
            .map((e) => e)
            .toList());

    var reservationContainers = List.from(
        Get.find<ReservationDetailsController>()
            .reservationDetails
            .value
            .containers!
            .map((e) => e)
            .toList());

    var toMappedContainer = tempContainerInsuranceNotBooked.isNotEmpty
        ? tempContainerInsuranceNotBooked
        : reservationContainers;

    for (ContainerRate containerRate in tempContainerRateList) {
      ContainerDisplay payload = ContainerDisplay(
        containerTypeGuid: containerRate.containerTypeGuid,
        containerTypeName: containerRate.containerTypeName,
        containerSizeGuid: containerRate.containerSizeGuid,
        containerSizeName: containerRate.containerSizeName,
        qty: containerRate.qty,
        publishedRateAmount: containerRate.publishedRateAmount,
        totalAmount: containerRate.totalAmount,
        publishedCurrencyCode: containerRate.publishedCurrencyCode,
        containers: [],
      );

      for (var cont in toMappedContainer) {
        if (cont.typeId == containerRate.containerTypeGuid &&
            cont.sizeId == containerRate.containerSizeGuid) {
          payload.containers!.add(cont);
          continue;
        }
      }

      containerSummaryList.add(payload);
    }

    setContainerDisplays(containerSummaryList);

    Get.toNamed('/payment-summary');
  }
}

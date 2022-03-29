import 'package:flutter/material.dart';
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

    checkIfHasNoContainerRates();
  }

  checkIfHasNoContainerRates() async {
    var hasNoRates =
        selectedInsuranceProvider.value.containerRateList?.containerListNoRates;

    // ignore: prefer_is_empty
    if (hasNoRates?.length != 0) {
      var res = await Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 270,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.error_outline_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(
                        12,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'No rates available under ${selectedInsuranceProvider.value.name} for the folllowing:',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 70,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, index) {
                                    return Text(
                                      "${hasNoRates![index].containerTypeName} / ${hasNoRates[index].containerSizeName} / ${hasNoRates[index].qty}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (ctx, index) {
                                    return const SizedBox(
                                      height: 5,
                                    );
                                  },
                                  itemCount: hasNoRates?.length ?? 0,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Do you want to proceed with other containers?',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.grey,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Get.back(result: false);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(
                              2,
                              39,
                              108,
                              1,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'Proceed',
                              style: TextStyle(
                                fontSize: 12,
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
                          Get.back(result: true);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

      if (res) {
        Get.toNamed('/payment-summary');
      }
    } else {
      Get.toNamed('/payment-summary');
    }
  }
}

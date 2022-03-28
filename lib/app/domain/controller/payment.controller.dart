import 'dart:developer';

import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class PaymentController extends GetxController {
  final IPayment _paymentService = PaymentService();

  final paymentProviders = <PaymentProvider>[].obs;

  RxBool isLoading = true.obs;

  final selectedProvider = PaymentProvider().obs;

  RxBool showDetails = false.obs;

  final computedRates = ComputedRates().obs;

  setPaymentProviders(value) {
    paymentProviders.value = value;
    update();
  }

  setIsLoading(value) {
    isLoading.value = value;
    update();
  }

  setShowDetails(value) {
    showDetails.value = value;
    update();
  }

  setSelectedPaymentProvider(PaymentProvider value) async {
    selectedProvider.value = value;
    update();

    if (value.productGuid != null) {
      await computeCpfRates();
    }
  }

  setComputedRates(ComputedRates value) {
    computedRates.value = value;
    update();
  }

  getPaymentProviders() {
    setIsLoading(true);

    _paymentService.getListOfPaymentProvider().then((result) {
      // var tempProviderList =
      //     result.where((pp) => pp.productName == 'UPay').toList();
      // setPaymentProviders(tempProviderList);
      setPaymentProviders(result);
      setIsLoading(false);
    }).catchError((e) {
      setIsLoading(false);
    });
  }

  computeCpfRates() {
    setShowDetails(false);

    var payload = {
      "limitMinimum": selectedProvider.value.limitMinimum.toInt(),
      "limitMaximum": selectedProvider.value.limitMaximum.toInt(),
      "localValue": selectedProvider.value.localValue.toInt(),
      "foreignValue": selectedProvider.value.foreignValue.toInt(),
      "isPercentage": selectedProvider.value.isPercentage,
      "paymentType": 2,
      "payorId": Get.find<ProfileController>().company.value.companyId,
      "payeeId":
          Get.find<InsuranceController>().selectedInsuranceProvider.value.guid,
      "totalAmount": Get.find<InsuranceController>()
          .selectedInsuranceProvider
          .value
          .containerRateList!
          .totalPublishedAmount,
    };

    inspect(payload);

    _paymentService
        .computeCpfRates(
      payload: payload,
    )
        .then((result) {
      setComputedRates(result);
      setShowDetails(true);
    }).catchError((e) {
      setShowDetails(true);
    });
  }
}

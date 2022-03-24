import 'package:get/get.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class InsuranceController extends GetxController {
  final IInsurance _insuranceService = InsuranceService();

  final insuredContainer = <dynamic>[].obs;

  final insuranceProviders = <InsuranceProvider>[].obs;

  final selectedInsuranceProvider = InsuranceProvider().obs;

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
}

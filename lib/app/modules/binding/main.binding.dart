import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ServiceController(),
      permanent: true,
    );
    Get.put(
      ProfileController(),
      permanent: true,
    );
    Get.put(
      ReservationDetailsController(),
      permanent: true,
    );
    Get.put(
      InsuranceController(),
      permanent: true,
    );
  }
}

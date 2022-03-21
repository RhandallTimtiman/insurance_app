import 'package:get/get.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class ServiceController extends GetxController {
  final activeService = Service().obs;

  final services = <Service>[].obs;

  setActiveService(Service value) {
    activeService.value = value;
    update();
  }

  setListOfService(value) {
    services.value = value;
    update();
  }
}

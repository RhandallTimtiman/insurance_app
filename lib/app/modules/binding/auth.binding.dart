import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}

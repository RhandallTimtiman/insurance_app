import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class AuthController extends GetxController {
  RxBool obscureText = true.obs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

  final IAuthInterface _authService = AuthService();

  /// Toggles Visibility Of Field
  void toggle() async {
    obscureText.toggle();
  }

  /// Sign In Functionality
  Future<void> signIn() async {
    if (authFormKey.currentState!.validate()) {
      Get.dialog(
        Dialog(
          backgroundColor: Colors.white12,
          child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(
                      strokeWidth: 7.0,
                      backgroundColor: Color.fromRGBO(244, 162, 64, 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please wait...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );

      print(userNameController.text);
      print(passwordController.text);

      _authService
          .signIn(
        userName: userNameController.text,
        password: passwordController.text,
      )
          .then((result) {
        Get.find<ServiceController>().setListOfService(result);
        Get.back();
        Get.snackbar(
          'Success',
          'Login Successfully!',
          colorText: Colors.white,
          backgroundColor: Colors.green[500],
          duration: const Duration(
            seconds: 2,
          ),
        );
        Get.offAllNamed('/service-option');
      }).catchError((error) {
        Get.back();
        Get.snackbar(
          'Something Went Wrong!',
          error.message,
          backgroundColor: Colors.red[400],
          colorText: Colors.white,
          duration: const Duration(
            seconds: 2,
          ),
        );
      });
    }
  }
}

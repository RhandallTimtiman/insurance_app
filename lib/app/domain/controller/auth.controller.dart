import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class AuthController extends GetxController {
  RxBool obscureText = true.obs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

  final IAuth _authService = AuthService();

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
                      backgroundColor: const Color.fromRGBO(
                        2,
                        39,
                        108,
                        1,
                      ),
                      color: const Color.fromRGBO(
                        237,
                        108,
                        77,
                        1,
                      ),
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

      _authService
          .signIn(
        userName: userNameController.text,
        password: passwordController.text,
      )
          .then((result) {
        List<Service> temp = result
            .where((s) => s.code == 'SC' || s.code == 'FF' || s.code == 'CB')
            .toList();

        if (temp.isNotEmpty) {
          Get.find<ServiceController>().setListOfService(temp);
          Get.find<ProfileController>().setUsername(userNameController.text);
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
        } else {
          Get.back();
          Get.snackbar(
            'Error',
            'This feature is not available to you',
            backgroundColor: Colors.red[400],
            colorText: Colors.white,
            duration: const Duration(
              seconds: 2,
            ),
          );
        }
      }).catchError((error) {
        Get.back();

        String message = error.response != null
            ? error.response.data["message"]
            : error.message;

        message = message.contains('Http status error [400]')
            ? 'Incorrect Username or Password'
            : message;

        var wasInvalid = message.contains('Invalid Credentials');

        Get.snackbar(
          'Something Went Wrong!',
          wasInvalid ? 'Invalid credentials' : message,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class ProfileController extends GetxController {
  final IProfile _profileService = ProfileService();

  final company = Company().obs;

  final username = "".obs;

  Future<void> getProfileDetails({required serviceId}) async {
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
                    "Fetching User Information...",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );

    await _profileService
        .getProfileDetails(serviceId: serviceId)
        .then((result) {
      setCompany(result);
      Get.back();
      Get.snackbar(
        'Success',
        'User information retrieved successfully!',
        colorText: Colors.white,
        backgroundColor: Colors.green[500],
        duration: const Duration(
          seconds: 1,
        ),
      );
      Get.offAllNamed('/list');
    }).catchError((e) {
      Get.back();
      Get.snackbar(
        'Error',
        'Please contact your administrator!',
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: const Duration(
          seconds: 2,
        ),
      );
    });
  }

  setCompany(value) {
    company.value = value;
    update();
  }

  setUsername(value) {
    username.value = value;
    update();
  }
}

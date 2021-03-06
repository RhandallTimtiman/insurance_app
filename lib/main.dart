import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_app/app/core/route/app.routes.dart';
import 'package:insurance_app/app/modules/binding/bindings.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: '/login',
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
    );
  }
}

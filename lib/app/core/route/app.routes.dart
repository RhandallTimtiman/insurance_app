import 'package:get/get.dart';
import 'package:insurance_app/app/modules/binding/bindings.dart';
import 'package:insurance_app/app/modules/screens/screens.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/service-option',
      page: () => const LoginServiceOptionScreen(),
    ),
    GetPage(
      name: '/list',
      page: () => const ReservationListingScreen(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: '/details',
      page: () => const ReservationDetailsScreen(),
    ),
    GetPage(
      name: '/insurance-options',
      page: () => const InsuranceOptionsScreen(),
    ),
    GetPage(
      name: '/payment-summary',
      page: () => const PaymentSummaryScreen(),
    ),
    GetPage(
      name: '/payment-option',
      page: () => const PaymentOptionScreen(),
    ),
    // GetPage(
    //   name: '/insurance-details',
    //   page: () => const InsuranceDetailsScreen(),
    // ),
  ];
}

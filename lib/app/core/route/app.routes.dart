import 'package:get/get.dart';
import 'package:insurance_app/app/modules/screens/screens.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(
      name: '/list',
      page: () => const ReservationListingScreen(),
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
    // GetPage(
    //   name: '/insurance-details',
    //   page: () => const InsuranceDetailsScreen(),
    // ),
  ];
}

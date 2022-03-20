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
      name: '/cpf',
      page: () => const ContainerProtectionScreen(),
    )
  ];
}

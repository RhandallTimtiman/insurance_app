import 'package:insurance_app/app/domain/model/models.dart';

abstract class IInsurance {
  Future<List<InsuranceProvider>> getRecommendedInsurance({
    required containers,
    countryCode = 'PH',
  });
}

import 'package:insurance_app/app/domain/model/models.dart';

abstract class IPayment {
  Future<List<PaymentProvider>> getListOfPaymentProvider({
    countryCode = "PH",
    currencyCode = "PHP",
  });

  Future<ComputedRates> computeCpfRates({
    payload,
  });
}

import 'package:insurance_app/app/domain/model/models.dart';

abstract class IAuth {
  Future<List<Service>> signIn({
    required userName,
    required password,
  });

  Future<bool> refreshExpiredToken();
}

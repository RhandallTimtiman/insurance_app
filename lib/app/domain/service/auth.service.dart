import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/core/utils/database.helper.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';

class AuthService implements IAuthInterface {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  final dbHelper = DatabaseHelper.instance;

  @override
  Future signIn({required userName, required password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}

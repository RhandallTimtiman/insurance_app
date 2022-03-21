import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/core/utils/database.helper.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';

class AuthService implements IAuthInterface {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  final dbHelper = DatabaseHelper.instance;

  @override
  Future getData() async {
    // TODO: implement getData
    print('haw haw de karabao');
    return "hello";
  }
}

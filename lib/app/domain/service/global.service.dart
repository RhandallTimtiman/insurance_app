import 'package:dio/dio.dart';
import 'package:insurance_app/app/core/constants/api.routes.dart';
import 'package:insurance_app/app/core/utils/api.interceptor.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';

class GlobalService implements IGlobal {
  final _dio = Dio()..interceptors.add(ApiInterceptor());

  @override
  Future<String> presignImage({required imageUrl}) async {
    _dio.options.headers = <String, dynamic>{
      "requiresToken": true,
    };

    try {
      var url = '/global/cms/api/v1/file/pre-signed';

      var uri = Uri.https(ApiRoutes.cms, url, {
        'path': imageUrl,
      });

      Response response = await _dio.getUri(uri);

      if (response.statusCode == 200) {
        var body = response.data;

        var presignedImage = body["data"]["presigneUrl"];

        return presignedImage;
      } else {
        return 'https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-no-image-available-icon-flat-vector.jpg?ver=6';
      }
    } catch (e) {
      rethrow;
    }
  }
}

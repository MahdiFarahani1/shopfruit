import 'package:dio/dio.dart';
import 'package:shop/config/constants.dart';

class ApiHomeProvider {
  Dio dio;
  ApiHomeProvider(this.dio);
  dynamic callHomeApi(lat, lon) async {
    var resopne = await dio
        .get(Constants.baseUrl, queryParameters: {"lat": lat, "lon": lon});

    return resopne;
  }
}

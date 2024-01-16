import 'package:dio/dio.dart';
import 'package:shop/config/constants.dart';

class ApiAuthProvider {
  final Dio dio;

  ApiAuthProvider({required this.dio});

  Future<dynamic> cllerApi(
      String name, String family, String username, String pass) async {
    Response response = await dio.post(Constants.authUrl,
        options: Options(
          contentType: 'application/json',
        ),
        data: {
          "name": name,
          "family": family,
          "username": username,
          "pass": pass
        });
    return response;
  }
}

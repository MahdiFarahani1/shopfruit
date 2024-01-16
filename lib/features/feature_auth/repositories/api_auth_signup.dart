import 'package:dio/dio.dart';
import 'package:shop/features/feature_auth/data/api_auth_provider.dart';

class SignUpRepositoreis {
  final ApiAuthProvider apiAuthProvider;

  SignUpRepositoreis({required this.apiAuthProvider});

  Future<String> sendData(
      {required String name,
      required String family,
      required String username,
      required String pass}) async {
    try {
      var response =
          await apiAuthProvider.cllerApi(name, family, username, pass);

      if (response.statusCode == 200) {
        String data = response.data;
        if (data == 'User registered successfully') {
          return "SignUp Success : $data";
        } else {
          return 'Username is taken';
        }
      } else {
        throw Exception("Network response was not ok");
      }
    } catch (e) {
      if (e is DioError) {
        print('Dio Error: ${e.response?.statusCode} - ${e.response?.data}');
      }
      throw Exception("Your Have Erorr : $e");
    }
  }
}

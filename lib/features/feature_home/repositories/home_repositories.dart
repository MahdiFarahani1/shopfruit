import 'package:dio/dio.dart';

import 'package:eshakmohsen/features/feature_home/data/data_source/apiProvide.dart';
import 'package:eshakmohsen/features/feature_home/data/models/model.dart';
import 'package:eshakmohsen/features/feature_home/repositories/data_state.dart';

class HomeRepositories {
  ApiHomeProvider apiHomeProvider;
  HomeRepositories({required this.apiHomeProvider});

  Future<DataState<MyModel>> fetchdata(lat, lon) async {
    try {
      Response response = await apiHomeProvider.callHomeApi(lat, lon);

      final MyModel mymodel = MyModel.fromJson(response.data);
      return DataSuccses(mymodel);
    } catch (e) {
      return DataFailed("Erorr :$e");
    }
  }
}

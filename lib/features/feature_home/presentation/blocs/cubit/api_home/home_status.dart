import 'package:shop/features/feature_home/data/models/model.dart';

abstract class HomeStatus {}

class HomeInitial extends HomeStatus {}

class HomeLoading extends HomeStatus {}

class HomeComplate extends HomeStatus {
  final MyModel homemodel;

  HomeComplate({required this.homemodel});
}

class HomeErorr extends HomeStatus {
  final String erorr;

  HomeErorr({required this.erorr});
}

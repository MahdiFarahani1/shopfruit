import 'package:dio/dio.dart';
import 'package:shop/common/utils/Perfs_oparator.dart';
import 'package:shop/features/feature_auth/data/api_auth_provider.dart';
import 'package:shop/features/feature_home/data/data_source/apiProvide.dart';
import 'package:shop/features/feature_home/repositories/home_repositories.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  locator.registerSingleton<PrefsOprator>(PrefsOprator());

  locator.registerSingleton<ApiHomeProvider>(ApiHomeProvider(locator()));

  locator.registerSingleton<HomeRepositories>(
      HomeRepositories(apiHomeProvider: locator()));
}

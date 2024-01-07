import 'package:bloc/bloc.dart';
import 'package:eshakmohsen/features/feature_home/presentation/blocs/cubit/api_home/home_status.dart';
import 'package:eshakmohsen/features/feature_home/repositories/data_state.dart';
import 'package:eshakmohsen/features/feature_home/repositories/home_repositories.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepositories homeRepositories;

  HomeCubit(this.homeRepositories)
      : super(HomeState(homeStatus: HomeLoading()));

  managmentHomeApiData(lat, lon) async {
    emit(state.copywith(newhomeStatus: HomeLoading()));

    DataState dataState = await homeRepositories.fetchdata(lat, lon);

    if (dataState is DataSuccses) {
      emit(state.copywith(
          newhomeStatus: HomeComplate(homemodel: dataState.data)));
    }

    if (dataState is DataFailed) {
      emit(state.copywith(newhomeStatus: HomeErorr(erorr: dataState.message!)));
    }
  }
}

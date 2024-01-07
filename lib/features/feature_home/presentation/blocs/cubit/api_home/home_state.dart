part of 'home_cubit.dart';

class HomeState {
  final HomeStatus homeStatus;

  HomeState({required this.homeStatus});

  HomeState copywith({HomeStatus? newhomeStatus}) {
    return HomeState(homeStatus: newhomeStatus ?? homeStatus);
  }
}

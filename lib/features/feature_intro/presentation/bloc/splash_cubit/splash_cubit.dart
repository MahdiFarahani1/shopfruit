import 'package:bloc/bloc.dart';
import 'package:eshakmohsen/features/feature_intro/repositorys/intro_reposetory.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';
part 'connection_status.dart';

class SplashCubit extends Cubit<SplashState> {
  IntroRepository splashRepository = IntroRepository();

  SplashCubit() : super(SplashState(connectionStatus: ConnectionInitial()));

  void checkConnectionEvent() async {
    emit(state.copyWith(newConnectionStatus: ConnectionInitial()));

    bool isConnect = await splashRepository.checkConnetion();

    if (isConnect) {
      emit(state.copyWith(newConnectionStatus: ConnectionOn()));
    } else {
      emit(state.copyWith(newConnectionStatus: ConnectionOff()));
    }
  }
}

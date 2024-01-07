import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(const IntroState(showStartBtn: false));

  void checkBtn(bool value) {
    emit(state.copywith(newshowStartBtn: value));
  }
}

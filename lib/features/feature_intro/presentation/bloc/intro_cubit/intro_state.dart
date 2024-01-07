part of 'intro_cubit.dart';

@immutable
class IntroState {
  final bool showStartBtn;

  const IntroState({required this.showStartBtn});

  IntroState copywith({required bool? newshowStartBtn}) {
    return IntroState(showStartBtn: newshowStartBtn ?? showStartBtn);
  }
}

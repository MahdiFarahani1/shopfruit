import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'icon_state.dart';

class IconCubit extends Cubit<IconState> {
  IconCubit()
      : super(
            const IconState(visitBool: true, visitIcon: Icons.visibility_off));

  void eventIcon(IconData data) {
    if (data == Icons.visibility_off) {
      emit(const IconState(visitBool: false, visitIcon: Icons.visibility));
    } else {
      emit(const IconState(visitBool: true, visitIcon: Icons.visibility_off));
    }
  }
}

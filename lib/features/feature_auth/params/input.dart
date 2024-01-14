import 'package:flutter/material.dart';

class InputModel {
  final BuildContext context;
  final String text;
  final TextInputType type;
  final bool showIcon;
  final IconData? myicon;
  final bool obs;
  final ValidEnum typeForValid;

  InputModel(
      {required this.context,
      required this.text,
      required this.type,
      required this.showIcon,
      this.myicon,
      required this.obs,
      required this.typeForValid});
}

enum ValidEnum { name, number, pass }

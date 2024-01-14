import 'package:flutter/material.dart';

class BtnModel {
  final BuildContext context;
  final Function ontap;
  final String text;
  final Color frist;
  final Color last;

  BtnModel(
      {required this.context,
      required this.ontap,
      required this.text,
      required this.frist,
      required this.last});
}

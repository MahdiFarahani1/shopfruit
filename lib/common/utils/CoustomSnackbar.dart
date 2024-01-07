import 'package:flutter/material.dart';

class CoustomSnackBar {
  CoustomSnackBar.showsnackbar(context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )));
  }
}

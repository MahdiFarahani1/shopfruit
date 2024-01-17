import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoustomSnackBar {
  CoustomSnackBar.showsnackbar(context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )));
  }

  CoustomSnackBar.getxsnack(
      String title, String message, SnackPosition snackPosition, Color col) {
    Get.snackbar(title, message,
        backgroundGradient: LinearGradient(colors: [col, col.withAlpha(150)]),
        snackPosition: snackPosition,
        margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
        backgroundColor: col,
        borderRadius: 16);
  }
}

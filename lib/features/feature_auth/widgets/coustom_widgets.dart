import 'package:flutter/material.dart';

class CustomWidgets {
  static Widget btnAuth(BuildContext context, Function ontap, String text,
      Color frist, Color last) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.7,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [frist, last],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            fixedSize: Size(MediaQuery.sizeOf(context).width / 1.7, 40)),
        onPressed: () {
          ontap();
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,

            fontFamily: "Vazir",
            color: Colors.white, // رنگ متن دکمه
          ),
        ),
      ),
    );
  }
}

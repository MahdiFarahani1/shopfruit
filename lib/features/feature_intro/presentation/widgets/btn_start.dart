import 'package:flutter/material.dart';

class BtnStart extends StatefulWidget {
  final String text;
  final Function ontap;
  const BtnStart({super.key, required this.text, required this.ontap});

  @override
  State<BtnStart> createState() => _BtnStartState();
}

class _BtnStartState extends State<BtnStart> with TickerProviderStateMixin {
  late AnimationController fadecontroller;
  late Animation<double> fadeanimation;

  @override
  void initState() {
    super.initState();

    fadecontroller = AnimationController(
        vsync: this, duration: const Duration(seconds: 2), value: 0);
    fadeanimation = CurvedAnimation(parent: fadecontroller, curve: Curves.ease);
    fadecontroller.forward();
  }

  @override
  void dispose() {
    fadecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeanimation,
      child: SizedBox(
          width: 125,
          height: 45,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                widget.ontap();
              },
              child: Text(
                widget.text,
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ))),
    );
  }
}

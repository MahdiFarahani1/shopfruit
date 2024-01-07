import 'package:flutter/material.dart';

class MyTest extends StatelessWidget {
  static const String rn = "/test";
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: ElevatedButton(
        onPressed: () {},
        child: Text("mehdi joon"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ObjectNav extends StatelessWidget {
  final Icon icon;
  final String text;
  const ObjectNav({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: icon),
        Text(text),
      ],
    );
  }
}

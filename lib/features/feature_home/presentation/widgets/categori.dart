import 'package:shop/features/feature_product/presentation/screen/products_screen.dart';
import 'package:flutter/cupertino.dart';

class Cat extends StatelessWidget {
  final String text;
  final String imagePath;
  const Cat({super.key, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductScreen.rn);
            },
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          text,
          style: const TextStyle(
            fontFamily: "Vazir",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

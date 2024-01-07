import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Value extends StatelessWidget {
  final String title;
  final String description;
  final String pathimage;
  const Value(
      {super.key,
      required this.title,
      required this.description,
      required this.pathimage});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          height: height * 0.6,
          child: DelayedDisplay(
              fadingDuration: const Duration(seconds: 1),
              delay: const Duration(milliseconds: 300),
              child: Image.asset(
                pathimage,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DelayedDisplay(
            fadingDuration: const Duration(seconds: 1),
            delay: const Duration(milliseconds: 450),
            child: Text(
              title,
              style: textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: DelayedDisplay(
            fadingDuration: const Duration(seconds: 1),
            delay: const Duration(milliseconds: 650),
            child: Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.amber,
              direction: ShimmerDirection.rtl,
              child: Text(
                description,
                style: textTheme.bodyMedium,
              ),
            ),
          ),
        )
      ],
    );
  }
}

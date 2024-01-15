import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DataText {
  static Widget callText() {
    DateTime dateTime = DateTime.now();
    int hourNow = dateTime.hour;
    String greeting;
    if (hourNow >= 4 && hourNow < 12) {
      greeting = 'خوش آمدید صبح خوبی داشته باشید';
    } else if (hourNow >= 12 && hourNow < 19) {
      greeting = 'خوش آمدید عصر خوبی داشته باشید';
    } else {
      greeting = 'خوش آمدید شب خوبی داشته باشید';
    }

    return Shimmer.fromColors(
      baseColor: Colors.redAccent,
      highlightColor: Colors.white,
      direction: ShimmerDirection.rtl,
      child: FittedBox(
        child: Text(
          greeting,
          style: const TextStyle(
              fontFamily: "Vazir", fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

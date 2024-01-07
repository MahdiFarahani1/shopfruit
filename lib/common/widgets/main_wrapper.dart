import 'package:eshakmohsen/common/widgets/bottom_nav.dart';

import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});
  static const String rn = "/mainwrapper";

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}

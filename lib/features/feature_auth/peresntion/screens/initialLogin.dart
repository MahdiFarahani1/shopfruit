import 'package:eshakmohsen/config/constants.dart';
import 'package:eshakmohsen/features/feature_auth/widgets/coustom_widgets.dart';
import 'package:flutter/material.dart';

class InitLogan extends StatelessWidget {
  const InitLogan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.bgPinkColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 4.5,
          ),
          CustomWidgets.btnAuth(
              context, () {}, "وارد شوید", Colors.redAccent, Colors.blueAccent),
          const SizedBox(
            height: 16,
          ),
          CustomWidgets.btnAuth(context, () {}, "ثبت نام کنید",
              Colors.blueAccent, Colors.redAccent),
        ],
      ),
    );
  }
}

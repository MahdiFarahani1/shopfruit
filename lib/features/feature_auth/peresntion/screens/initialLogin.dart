import 'package:shop/config/constants.dart';
import 'package:shop/features/feature_auth/params/btn_login.dart';
import 'package:shop/features/feature_auth/peresntion/screens/login.dart';
import 'package:shop/features/feature_auth/peresntion/screens/sign_up.dart';
import 'package:shop/features/feature_auth/repositories/data_repositories.dart';
import 'package:shop/features/feature_auth/widgets/coustom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitLogan extends StatelessWidget {
  const InitLogan({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Constants.bgPinkColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: DataText.callText(),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 4.5,
              ),
              CustomWidgets.btnAuth(BtnModel(
                  context: context,
                  ontap: () {
                    Get.to(const Loginpage());
                  },
                  text: "وارد شوید",
                  frist: Colors.pinkAccent.shade700,
                  last: Colors.pinkAccent)),
              const SizedBox(
                height: 16,
              ),
              CustomWidgets.btnAuth(BtnModel(
                  context: context,
                  ontap: () {
                    Get.to(const SignUp());
                  },
                  text: "ثبت نام کنید",
                  frist: Colors.pinkAccent,
                  last: Colors.pinkAccent.shade700)),
            ],
          ),
        ),
      ),
    );
  }
}

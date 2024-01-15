import 'package:shop/common/utils/CoustomSnackbar.dart';
import 'package:shop/config/constants.dart';
import 'package:shop/features/feature_auth/params/btn_login.dart';
import 'package:shop/features/feature_auth/params/input.dart';
import 'package:shop/features/feature_auth/peresntion/bloc/icon_visibility/cubit/icon_cubit.dart';
import 'package:shop/features/feature_auth/widgets/coustom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgPinkColor,
      appBar: AppBar(
        backgroundColor: Constants.bgPinkColor,
      ),
      body: BlocProvider(
        create: (context) => IconCubit(),
        child: BlocBuilder<IconCubit, IconState>(
          builder: (context, state) {
            return Form(
              key: Constants.formkey,
              child: Column(
                children: [
                  CustomWidgets.textAuth("همین حالا وارد شوید"),
                  CustomWidgets.input(InputModel(
                      context: context,
                      text: "تلفن همراه",
                      type: TextInputType.number,
                      showIcon: false,
                      obs: false,
                      typeForValid: ValidEnum.number)),
                  CustomWidgets.input(InputModel(
                      context: context,
                      text: "رمز عبور",
                      type: TextInputType.text,
                      showIcon: true,
                      obs: state.visitBool,
                      myicon: state.visitIcon,
                      typeForValid: ValidEnum.pass)),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CustomWidgets.btnAuth(
                      BtnModel(
                          context: context,
                          ontap: () {
                            if (Constants.formkey.currentState!.validate()) {
                              CoustomSnackBar.showsnackbar(
                                  context, "ورود انجام شد", Colors.greenAccent);
                            }
                          },
                          text: "وارد شوید",
                          frist: Colors.pinkAccent.shade700,
                          last: Colors.pinkAccent),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

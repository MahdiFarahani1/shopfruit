import 'package:eshakmohsen/config/constants.dart';
import 'package:eshakmohsen/features/feature_auth/params/btn_login.dart';
import 'package:eshakmohsen/features/feature_auth/params/input.dart';
import 'package:eshakmohsen/features/feature_auth/peresntion/bloc/icon_visibility/cubit/icon_cubit.dart';
import 'package:eshakmohsen/features/feature_auth/widgets/coustom_widgets.dart';
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
            return Column(
              children: [
                CustomWidgets.textAuth("همین حالا وارد شوید"),
                CustomWidgets.input(InputModel(
                    context: context,
                    text: "تلفن همراه",
                    type: TextInputType.number,
                    showIcon: false,
                    obs: false)),
                CustomWidgets.input(InputModel(
                    context: context,
                    text: "رمز عبور",
                    type: TextInputType.text,
                    showIcon: true,
                    obs: state.visitBool,
                    myicon: state.visitIcon)),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CustomWidgets.btnAuth(
                    BtnModel(
                        context: context,
                        ontap: () {},
                        text: "وارد شوید",
                        frist: Colors.pinkAccent.shade700,
                        last: Colors.pinkAccent),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

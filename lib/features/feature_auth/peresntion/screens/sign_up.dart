import 'package:eshakmohsen/config/constants.dart';
import 'package:eshakmohsen/features/feature_auth/params/btn_login.dart';
import 'package:eshakmohsen/features/feature_auth/peresntion/bloc/icon_visibility/cubit/icon_cubit.dart';
import 'package:eshakmohsen/features/feature_auth/widgets/coustom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgPinkColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Constants.bgPinkColor,
      ),
      body: BlocProvider(
        create: (context) => IconCubit(),
        child: BlocBuilder<IconCubit, IconState>(
          builder: (context, state) {
            return Column(
              children: [
                CustomWidgets.textAuth("همین حالا ثبت نام کنید"),
                CustomWidgets.input(
                    context, "نام", TextInputType.text, false, null, false),
                CustomWidgets.input(context, "نام خانوادگی", TextInputType.text,
                    false, null, false),
                CustomWidgets.input(context, "تلفن همراه", TextInputType.number,
                    false, null, false),
                CustomWidgets.input(context, "رمز عبور", TextInputType.text,
                    true, state.visitIcon, state.visitBool),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CustomWidgets.btnAuth(BtnModel(
                      context: context,
                      ontap: () {},
                      text: "ثبت نام",
                      frist: Colors.pinkAccent,
                      last: Colors.pinkAccent.shade700)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

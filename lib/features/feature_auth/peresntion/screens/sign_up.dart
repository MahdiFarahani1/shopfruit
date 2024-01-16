import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop/common/utils/CoustomSnackbar.dart';
import 'package:shop/config/constants.dart';
import 'package:shop/features/feature_auth/data/api_auth_provider.dart';
import 'package:shop/features/feature_auth/params/btn_login.dart';
import 'package:shop/features/feature_auth/params/input.dart';
import 'package:shop/features/feature_auth/peresntion/bloc/icon_visibility/cubit/icon_cubit.dart';
import 'package:shop/features/feature_auth/repositories/api_auth_signup.dart';
import 'package:shop/features/feature_auth/widgets/coustom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/locator.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txName = TextEditingController();
    TextEditingController txFamily = TextEditingController();
    TextEditingController txUsername = TextEditingController();
    TextEditingController txPass = TextEditingController();

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
            return Form(
              key: Constants.formkey,
              child: Column(
                children: [
                  CustomWidgets.textAuth("همین حالا ثبت نام کنید"),
                  CustomWidgets.input(InputModel(
                      context: context,
                      text: "نام",
                      type: TextInputType.text,
                      showIcon: false,
                      obs: false,
                      typeForValid: ValidEnum.name,
                      textEditingController: txName)),
                  CustomWidgets.input(InputModel(
                      context: context,
                      text: "نام خانوادگی",
                      type: TextInputType.text,
                      showIcon: false,
                      obs: false,
                      typeForValid: ValidEnum.name,
                      textEditingController: txFamily)),
                  CustomWidgets.input(InputModel(
                      context: context,
                      text: "تلفن همراه",
                      type: TextInputType.text,
                      showIcon: false,
                      obs: false,
                      typeForValid: ValidEnum.pass,
                      textEditingController: txUsername)),
                  CustomWidgets.input(InputModel(
                      context: context,
                      text: "رمز عبور",
                      type: TextInputType.text,
                      showIcon: true,
                      obs: state.visitBool,
                      myicon: state.visitIcon,
                      typeForValid: ValidEnum.pass,
                      textEditingController: txPass)),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CustomWidgets.btnAuth(BtnModel(
                        context: context,
                        ontap: () async {
                          if (Constants.formkey.currentState!.validate()) {
                            var api = await SignUpRepositoreis(
                                    apiAuthProvider:
                                        ApiAuthProvider(dio: Dio()))
                                .sendData(
                                    name: txName.text,
                                    family: txFamily.text,
                                    username: txUsername.text,
                                    pass: txPass.text);
                            print(api);
                          }
                        },
                        text: "ثبت نام",
                        frist: Colors.pinkAccent,
                        last: Colors.pinkAccent.shade700)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

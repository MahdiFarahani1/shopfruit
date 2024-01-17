import 'package:get/get.dart';
import 'package:shop/common/utils/CoustomSnackbar.dart';

import 'package:shop/config/constants.dart';
import 'package:shop/features/feature_auth/data/model/user_info.dart';
import 'package:shop/features/feature_auth/params/btn_login.dart';
import 'package:shop/features/feature_auth/params/input.dart';
import 'package:shop/features/feature_auth/peresntion/bloc/icon_visibility/cubit/icon_cubit.dart';
import 'package:shop/features/feature_auth/repositories/repository_database.dart';
import 'package:shop/features/feature_auth/widgets/coustom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txName = TextEditingController();
    TextEditingController txFamily = TextEditingController();
    TextEditingController txPhone = TextEditingController();
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
                      type: TextInputType.number,
                      showIcon: false,
                      obs: false,
                      typeForValid: ValidEnum.number,
                      textEditingController: txPhone)),
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
                            DataBaseRepository dataBaseRepository =
                                DataBaseRepository();
                            await dataBaseRepository.initUserDao();

                            try {
                              print(
                                  'Checking for user with phone: $txPhone.text');

                              if (await dataBaseRepository
                                  .userExistsWithPhone(txPhone.text)) {
                                CoustomSnackBar.getxsnack(
                                    "ارور",
                                    "این حساب قبلا ساخته شده",
                                    SnackPosition.TOP,
                                    Colors.red);
                              } else {
                                dataBaseRepository.addUser(UserInfo(
                                    id: 8,
                                    name: txName.text,
                                    family: txFamily.text,
                                    phone: txPhone.text,
                                    password: txPass.text));

                                CoustomSnackBar.getxsnack(
                                    "ثبت نام",
                                    "با موفقیت انجام شد",
                                    SnackPosition.TOP,
                                    Colors.green);
                              }
                            } catch (e) {
                              print('Error during sign up: $e');
                              CoustomSnackBar.getxsnack(
                                  "ارور",
                                  "شماره تلفن وارد شده معتبر نیست",
                                  SnackPosition.TOP,
                                  Colors.red);
                            }
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

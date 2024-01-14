import 'package:eshakmohsen/features/feature_auth/params/btn_login.dart';
import 'package:eshakmohsen/features/feature_auth/params/input.dart';
import 'package:eshakmohsen/features/feature_auth/peresntion/bloc/icon_visibility/cubit/icon_cubit.dart';
import 'package:eshakmohsen/features/feature_auth/repositories/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomWidgets {
  static Widget btnAuth(BtnModel btnModel) {
    return Container(
      width: MediaQuery.sizeOf(btnModel.context).width / 1.7,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [btnModel.frist, btnModel.last],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            fixedSize:
                Size(MediaQuery.sizeOf(btnModel.context).width / 1.7, 40)),
        onPressed: () {
          btnModel.ontap();
        },
        child: Text(
          btnModel.text,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Vazir",
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Widget input(InputModel inputModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "لطفا فرم را پر کنید";
          } else {
            switch (inputModel.typeForValid) {
              case ValidEnum.name:
                return FormValid.checkOnlyPersianLetters(value);
              case ValidEnum.number:
                return FormValid.checkOnlyNumbers(value);
              case ValidEnum.pass:
                return FormValid.checkPasswordStrength(value);
              default:
            }
          }
          return null;
        },
        keyboardType: inputModel.type,
        maxLength: 20,
        obscureText: inputModel.obs,
        decoration: InputDecoration(
            suffixIcon: inputModel.showIcon
                ? IconButton(
                    onPressed: () {
                      BlocProvider.of<IconCubit>(inputModel.context)
                          .eventIcon(inputModel.myicon!);
                    },
                    icon: Icon(inputModel.myicon))
                : null,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 10,
                    strokeAlign: 10,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            labelText: inputModel.text,
            labelStyle: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontFamily: "Vazir",
            ),
            counterText: ""),
      ),
    );
  }

  static Widget textAuth(String text) {
    return Container(
        margin: const EdgeInsets.all(12),
        alignment: Alignment.bottomRight,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Vazir"),
        ));
  }
}

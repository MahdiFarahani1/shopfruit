import 'package:delayed_display/delayed_display.dart';
import 'package:shop/common/utils/CoustomLoading.dart';
import 'package:shop/common/utils/Perfs_oparator.dart';
import 'package:shop/common/widgets/main_wrapper.dart';
import 'package:shop/features/feature_intro/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:shop/features/feature_intro/presentation/screens/intro_screenMain.dart';
import 'package:shop/locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: DelayedDisplay(
                    fadingDuration: const Duration(seconds: 1),
                    slidingBeginOffset: const Offset(0, -4),
                    child: Image.asset("assets/images/besenior_logo.png"))),
            BlocConsumer<SplashCubit, SplashState>(
              builder: (context, state) {
                if (state.connectionStatus is ConnectionInitial ||
                    state.connectionStatus is ConnectionOn) {
                  return Expanded(
                    child: CoustomLoading.loading(),
                  );
                }

                if (state.connectionStatus is ConnectionOff) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "به اینترنت متصل نیستید",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          splashColor: Colors.red,
                          onPressed: () {
                            BlocProvider.of<SplashCubit>(context)
                                .checkConnectionEvent();
                          },
                          icon: const Icon(Icons.restart_alt_outlined))
                    ],
                  );
                }
                return Container();
              },
              listener: (context, state) {
                if (state.connectionStatus is ConnectionOn) {
                  gettohome();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gettohome() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) async {
      PrefsOprator prefsOprator = locator();
      var showintro = await prefsOprator.getintro();

      if (showintro) {
        Navigator.pushNamed(context, IntroMain.rn);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, MainWrapper.rn, ModalRoute.withName(MainWrapper.rn));
      }
    });
  }
}

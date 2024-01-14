import 'package:eshakmohsen/common/widgets/main_wrapper.dart';
import 'package:eshakmohsen/config/my_theme.dart';
import 'package:eshakmohsen/features/feature_auth/peresntion/bloc/icon_visibility/cubit/icon_cubit.dart';
import 'package:eshakmohsen/features/feature_home/presentation/blocs/cubit/api_home/home_cubit.dart';
import 'package:eshakmohsen/features/feature_intro/presentation/bloc/intro_cubit/intro_cubit.dart';
import 'package:eshakmohsen/features/feature_intro/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:eshakmohsen/features/feature_intro/presentation/screens/intro_screen.dart';
import 'package:eshakmohsen/features/feature_intro/presentation/screens/intro_screenMain.dart';
import 'package:eshakmohsen/features/feature_product/presentation/screen/products_screen.dart';
import 'package:eshakmohsen/locator.dart';
import 'package:eshakmohsen/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLocator();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SplashCubit(),
    ),
    BlocProvider(
      create: (context) => IntroCubit(),
    ),
    BlocProvider(
      create: (context) => HomeCubit(locator()),
    ),
    BlocProvider(
      create: (context) => IconCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      supportedLocales: const [Locale("fa", ""), Locale("en", "")],
      locale: const Locale("fa", ""),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: "/",
      routes: {
        IntroMain.rn: (context) => const IntroMain(),
        MyTest.rn: (context) => const MyTest(),
        MainWrapper.rn: (context) => const MainWrapper(),
        "/ps": (context) => const ProductScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
    );
  }
}

import 'package:eshakmohsen/common/utils/Perfs_oparator.dart';
import 'package:eshakmohsen/common/widgets/main_wrapper.dart';
import 'package:eshakmohsen/features/feature_intro/presentation/bloc/intro_cubit/intro_cubit.dart';
import 'package:eshakmohsen/features/feature_intro/presentation/widgets/btn_start.dart';
import 'package:eshakmohsen/features/feature_intro/presentation/widgets/value.dart';
import 'package:eshakmohsen/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroMain extends StatelessWidget {
  static const rn = "/intromain";
  const IntroMain({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<Widget> widgetlist = [
      const Value(
        title: "فروشگاه میوه آنلاین",
        description:
            "با اپلیکیشن ما، تجربهٔ خرید میوه را به یک سطح جدید برده‌ایم. از طریق این فروشگاه آنلاین، به راحتی می‌توانید انواع میوه‌های تازه و ارگانیک را مشاهده و سفارش دهید. از توت فرنگی تا آووکادو، تمام محصولات ما با کیفیت بالا و قیمت مناسب عرضه می‌شوند. سفارشات شما با سرعت و دقت فوق‌العاده به دست شما می‌رسند.",
        pathimage: 'assets/images/tot.png',
      ),
      const Value(
        title: "تازگی میوه‌ها در دستان شما",
        description:
            "اگر به دنبال تجربه‌ای منحصر به فرد از خرید میوه تازه و تمیز هستید، اپلیکیشن ما بهترین انتخاب است. تمامی میوه‌های موجود در اینجا به دقت انتخاب و بررسی می‌شوند تا شما از تازگی و کیفیت بالای محصولات بهره‌مند شوید. با چند کلیک ساده، میوه‌های مورد علاقه خود را انتخاب کرده و به سرعت درب منزل خود تحویل بگیرید.",
        pathimage: 'assets/images/porteghal.png',
      ),
      const Value(
        title: "پرواز در دنیای میوه‌های طعم‌آمیز",
        description:
            "اپلیکیشن ما به شما این امکان را می‌دهد که به دنیایی از میوه‌های فراوان و طعم‌آمیز پرواز کنید. از نارنگی و پرتقال گرفته تا میوه‌های خاص و فصلی",
        pathimage: 'assets/images/ananas.png',
      ),
    ];
    PageController pageController = PageController(initialPage: 0);

    //  final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(200))),
            ),
          ),
          Positioned(
            bottom: height * 0.1,
            child: SizedBox(
              width: width,
              height: height * 0.9,
              child: PageView(
                onPageChanged: (page) {
                  if (page == 2) {
                    BlocProvider.of<IntroCubit>(context).checkBtn(true);
                  } else {
                    BlocProvider.of<IntroCubit>(context).checkBtn(false);
                  }
                },
                controller: pageController,
                children: widgetlist,
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.05,
            right: width * 0.1,
            child: BlocBuilder<IntroCubit, IntroState>(
              builder: (context, state) {
                if (state.showStartBtn) {
                  return BtnStart(
                    text: "شروع کنید",
                    ontap: () {
                      var prefsOp = locator<PrefsOprator>();
                      prefsOp.chnagestateintro();
                      Navigator.pushNamedAndRemoveUntil(context, MainWrapper.rn,
                          ModalRoute.withName(MainWrapper.rn));
                    },
                  );
                } else {
                  return BtnStart(
                    text: "ورق بزنید",
                    ontap: () {
                      if (pageController.page!.toInt() < 2) {
                        pageController.animateToPage(
                            pageController.page!.toInt() + 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);

                        if (pageController.page!.toInt() == 1) {
                          BlocProvider.of<IntroCubit>(context).checkBtn(true);
                        } else {
                          BlocProvider.of<IntroCubit>(context).checkBtn(false);
                        }
                      }
                    },
                  );
                }
              },
            ),
          ),
          Positioned(
              bottom: height * 0.05,
              left: width * 0.1,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.amber,
                    spacing: 5),
              ))
        ],
      ),
    );
  }
}

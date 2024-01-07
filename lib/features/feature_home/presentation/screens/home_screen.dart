import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshakmohsen/common/utils/CoustomLoading.dart';
import 'package:eshakmohsen/features/feature_home/data/models/model.dart';
import 'package:eshakmohsen/features/feature_home/presentation/blocs/cubit/api_home/home_cubit.dart';
import 'package:eshakmohsen/features/feature_home/presentation/blocs/cubit/api_home/home_status.dart';
import 'package:eshakmohsen/features/feature_home/presentation/widgets/categori.dart';
import 'package:eshakmohsen/features/feature_home/repositories/location.dart';
import 'package:eshakmohsen/features/feature_product/presentation/screen/products_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  PageController pageController = PageController(initialPage: 1);
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {ProductScreen.rn: (context) => const ProductScreen()},
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Builder(
            builder: (context) {
              LocationUser locationUser = LocationUser();

              locationUser.getUserLocation(context);
              return BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) {
                  if (previous.homeStatus == current.homeStatus) {
                    return false;
                  } else {
                    return true;
                  }
                },
                builder: (context, state) {
                  if (state.homeStatus is HomeLoading) {
                    return Center(child: CoustomLoading.loading());
                  }
                  if (state.homeStatus is HomeErorr) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (state.homeStatus as HomeErorr).erorr,
                            style: const TextStyle(
                                color: Colors.red,
                                fontFamily: "Vazir",
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<HomeCubit>(context)
                                  .managmentHomeApiData(1, 1);
                            },
                            icon: const Icon(
                              Icons.restart_alt_outlined,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  if (state.homeStatus is HomeComplate) {
                    MyModel view = (state.homeStatus as HomeComplate).homemodel;
                    List<Widget> items = [
                      Image.asset(
                        "assets/images/b1.png",
                      ),
                      Image.asset(
                        "assets/images/b2.png",
                      ),
                      Image.asset(
                        "assets/images/b3.png",
                      ),
                      Image.asset(
                        "assets/images/b4.png",
                      )
                    ];
                    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
                      if (pageController.hasClients &&
                          !pageController.position.outOfRange) {
                        if (pageController.page! < items.length - 1) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.fastOutSlowIn,
                          );
                        } else {
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.fastOutSlowIn,
                          );
                        }
                      }
                    });

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: PageView(
                                  controller: pageController, children: items),
                            ),
                          ),
                          SmoothPageIndicator(
                              controller: pageController,
                              count: 4,
                              effect: const ExpandingDotsEffect(
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  activeDotColor: Colors.redAccent)),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 300,
                            child: GridView(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 120,
                                crossAxisSpacing: 0.0,
                                mainAxisSpacing: 8.0,
                                crossAxisCount: 4,
                              ),
                              padding: const EdgeInsets.all(8),
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                Cat(
                                    imagePath: "assets/images/carrot.png",
                                    text: "میوه استوایی"),
                                Cat(
                                    imagePath: "assets/images/donat.png",
                                    text: "سبزیجات"),
                                Cat(
                                    imagePath: "assets/images/cucumber.png",
                                    text: "سبزیجات ارگانیک"),
                                Cat(
                                    imagePath: "assets/images/Strawberry.png",
                                    text: "مرکبات"),
                                Cat(
                                    imagePath: "assets/images/benana.png",
                                    text: "نهال ها"),
                                Cat(
                                    imagePath: "assets/images/Pineapple.png",
                                    text: "آبمیوه ها"),
                                Cat(
                                    imagePath: "assets/images/tomato.png",
                                    text: "میوه ارگانیک"),
                                Cat(
                                    imagePath: "assets/images/potato.png",
                                    text: "میوه خشک"),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.redAccent.shade100,
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height * 0.38,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Container(
                                    margin:
                                        const EdgeInsets.only(right: 8, top: 8),
                                    width: MediaQuery.sizeOf(context).width / 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.black,
                                            highlightColor: Colors.grey,
                                            direction: ShimmerDirection.rtl,
                                            child: const Text(
                                              "پیشنهاد های ویژه برای شما",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Vazir"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Image.asset(
                                            "assets/images/box.png",
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.2,
                                    height: 70,
                                    color: Colors.redAccent.shade100,
                                    margin: const EdgeInsets.all(10),
                                    child: Column(children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12)),
                                        child: CachedNetworkImage(
                                          imageUrl: view.deals![index + 6]
                                              .attachment!.url!,
                                          placeholder: (context, url) => Center(
                                            child:
                                                CoustomLoading.loadingImages(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2.2,
                                          color: Colors.redAccent,
                                          child: Column(
                                            children: [
                                              FittedBox(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  view.deals![index + 6]
                                                      .shortName!,
                                                  style: const TextStyle(
                                                      fontFamily: "Vazir",
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )),
                                              Row(
                                                children: [
                                                  const Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: Text(
                                                        "تخفیف ویژه :",
                                                        style: TextStyle(
                                                          fontFamily: "Vazir",
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      )),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          view.deals![index + 6]
                                                              .originalPrice
                                                              .toString(),
                                                          style: const TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough),
                                                        ),
                                                        Text(view
                                                            .deals![index + 6]
                                                            .discountedPrice
                                                            .toString()),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

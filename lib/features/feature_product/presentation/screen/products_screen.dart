import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop/common/utils/CoustomLoading.dart';
import 'package:shop/common/utils/random.dart';
import 'package:shop/features/feature_home/presentation/blocs/cubit/api_home/home_cubit.dart';
import 'package:shop/features/feature_home/presentation/blocs/cubit/api_home/home_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String rn = "/ps";
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height / 3;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        elevation: 50,
        centerTitle: true,
        title: const Text(
          "محصولات",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.homeStatus is HomeErorr) {
            return const Icon(Icons.error);
          }
          if (state.homeStatus is HomeLoading) {
            return Center(child: CoustomLoading.loading());
          }
          if (state.homeStatus is HomeComplate) {
            var view = (state.homeStatus as HomeComplate).homemodel;

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: height,
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.redAccent.shade100,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${view.deals![index].discountPercentage} : موجودی",
                                  style: const TextStyle(
                                      fontFamily: "Vazir", fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "  ارسال رایگان : ${RandomEvrything.yesOrno()}",
                                  style: const TextStyle(
                                      fontFamily: "Vazir", fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "${view.deals![index].originalPrice} : قیمت",
                                  style: const TextStyle(
                                      fontFamily: "Vazir", fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                            child: CachedNetworkImage(
                              imageUrl: view.deals![index].attachment!.url!,
                              fit: BoxFit.cover,
                              height: height / 1.5,
                              width: width / 2,
                              placeholder: (context, url) => Center(
                                child: CoustomLoading.loadingImages(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(80, 50),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12)))),
                              onPressed: () {},
                              child: const FittedBox(
                                child: Text(
                                  "خرید",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          FittedBox(
                            child: Text(
                              view.deals![index].shortName!,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: view.deals!.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}

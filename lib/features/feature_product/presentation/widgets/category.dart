import 'package:eshakmohsen/features/feature_product/presentation/screen/products_screen.dart';
import 'package:eshakmohsen/features/feature_product/presentation/widgets/list_cat.dart';
import 'package:flutter/material.dart';

class MainCategory extends StatelessWidget {
  const MainCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {ProductScreen.rn: (context) => const ProductScreen()},
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProductScreen.rn);
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.08,
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 9, top: 9),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          listCatImage[index],
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            listCatText[index],
                            style: const TextStyle(
                                fontFamily: "Vazir",
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: listCatImage.length,
            ),
          ),
        ),
      ),
    );
  }
}

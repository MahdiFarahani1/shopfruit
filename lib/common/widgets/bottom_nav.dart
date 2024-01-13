import 'package:eshakmohsen/features/feature_auth/peresntion/screens/initialLogin.dart';
import 'package:eshakmohsen/features/feature_home/presentation/screens/home_screen.dart';
import 'package:eshakmohsen/features/feature_product/presentation/widgets/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late PersistentTabController persistentTabController;
  @override
  void initState() {
    persistentTabController = PersistentTabController(initialIndex: 0);

    super.initState();
  }

  @override
  void dispose() {
    persistentTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> mainScreens = [
      HomeScreen(),
      const MainCategory(),
      const InitLogan(),
      Container(
        color: Colors.black87,
        child: const Center(
          child: Text(
            "به زودی...",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    ];

    return PersistentTabView(
      controller: persistentTabController,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      padding: const NavBarPadding.all(10),
      navBarHeight: MediaQuery.sizeOf(context).height * 0.1,
      screens: mainScreens,
      navBarStyle: NavBarStyle.style3,
      context,
      items: [
        PersistentBottomNavBarItem(
          inactiveIcon: const Icon(
            CupertinoIcons.home,
            size: 25,
          ),
          icon: const Icon(
            Icons.home,
            size: 32,
          ),
          title: ("خانه"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: const Icon(
            Icons.widgets_outlined,
            size: 25,
          ),
          icon: const Icon(
            Icons.widgets,
            size: 32,
          ),
          title: ("دسته بندی"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: const Icon(
            CupertinoIcons.person,
            size: 25,
          ),
          icon: const Icon(
            Icons.person_2_sharp,
            size: 32,
          ),
          title: ("حساب کاربر"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: const Icon(
            Icons.shop_2_outlined,
            size: 25,
          ),
          icon: const Icon(
            Icons.shop,
            size: 32,
          ),
          title: ("سبد خرید"),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ],
    );
  }
}

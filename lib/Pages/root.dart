import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/Pages/favorite_page.dart';
import 'package:plant_app/Pages/home_page.dart';
import 'package:plant_app/Pages/profile_page.dart';
import 'package:plant_app/Pages/scan_page.dart';
import 'package:plant_app/consts/constants.dart';
import 'package:plant_app/models/plant.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int bottomIndex = 0;
  List<Widget> pages() {
    return [
      const HomePage(),
      FavoritPage(
        favortiedPlants: favorites,
      ),
      CartPage(
        addedToCartPlants: myCart,
      ),
      const ProfilePage(),
    ];
  }

  List<IconData> iconsList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> appBarTitles = [
    "خانه",
    "علاقه مندی ها",
    "سبدخرید",
    "پروفایل",
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            appBarTitles[bottomIndex],
            style: TextStyle(
              fontFamily: "Lalezar",
              color: Constants.blackColor,
              fontSize: 25,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Constants.blackColor,
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: bottomIndex,
          children: pages(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                child: const ScanPage(),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
          shape: const CircleBorder(),
          backgroundColor: Constants.primaryColor,
          child: Image.asset(
            "assets/images/code-scan-two.png",
            height: 30,
          ),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Constants.blackColor.withOpacity(0.5),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          icons: iconsList,
          activeIndex: bottomIndex,
          onTap: (p0) {
            setState(() {
              bottomIndex = p0;
              final List<Plant> favaritedPlants = Plant.getFavoritedPlants();
              final List<Plant> addedToCartPlants = Plant.addedToCartPlants();
              favorites = favaritedPlants.toSet().toList();
              myCart = addedToCartPlants.toSet().toList();
            });
          },
        ),
      ),
    );
  }
}

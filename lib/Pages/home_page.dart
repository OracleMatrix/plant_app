import 'package:flutter/material.dart';
import 'package:plant_app/consts/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "رد کردن",
                style: TextStyle(
                  fontFamily: "Lalezar",
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 350.0,
                      child: Image.asset("assets/images/plant-one.png"),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      Constants.titleOne,
                      style: TextStyle(
                          fontFamily: "Lalezar",
                          fontSize: 25,
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      Constants.descriptionOne,
                      style: const TextStyle(
                          fontFamily: "iranSans",
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

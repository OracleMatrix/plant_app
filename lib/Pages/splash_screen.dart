import 'package:flutter/material.dart';
import 'package:plant_app/Pages/root.dart';
import 'package:plant_app/consts/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SmoothPageIndicator myPageIndicator() {
    return SmoothPageIndicator(
      controller: pageController,
      effect: ExpandingDotsEffect(
        dotColor: Colors.grey,
        activeDotColor: Constants.primaryColor,
      ),
      // effect: CustomizableEffect(
      //   dotDecoration: const DotDecoration(
      //       rotationAngle: 180,
      //       width: 15,
      //       verticalOffset: 5,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(4),
      //         bottomRight: Radius.circular(4),
      //       )),
      //   activeDotDecoration: const DotDecoration(
      //     width: 15,
      //     borderRadius: BorderRadius.only(
      //       topRight: Radius.circular(6),
      //       bottomLeft: Radius.circular(6),
      //     ),
      //   ),
      //   activeColorOverride: (index) => const Color(0xff296e48),
      //   inActiveColorOverride: (index) => Colors.grey,
      // ),
      count: 3,
    );
  }

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
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: [
              CreatePage(
                image: "assets/images/plant-one.png",
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              CreatePage(
                image: "assets/images/plant-two.png",
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              CreatePage(
                image: "assets/images/plant-three.png",
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 70,
            left: 30,
            child: myPageIndicator(),
          ),
          Positioned(
            bottom: 50,
            right: 30,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
                shape: const WidgetStatePropertyAll(CircleBorder()),
                backgroundColor: WidgetStatePropertyAll(Constants.primaryColor),
              ),
              onPressed: () {
                setState(() {
                  if (currentIndex < 2) {
                    currentIndex++;
                    if (currentIndex < 3) {
                      pageController.nextPage(
                          duration: const Duration(microseconds: 300),
                          curve: Curves.linear);
                    }
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RootPage(),
                      ),
                    );
                  }
                });
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String image, title, description;
  const CreatePage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350.0,
            child: Image.asset(image),
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
                fontFamily: "Lalezar",
                fontSize: 25,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            description,
            style: const TextStyle(
                fontFamily: "iranSans",
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

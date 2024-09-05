import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Pages/detail_page.dart';
import 'package:plant_app/Widgets/extension.dart';
import 'package:plant_app/consts/constants.dart';
import 'package:plant_app/models/plant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Plant> plantsList = Plant.plantList;

  int selectedIndex = 0;
  List<String> plantsCategory = [
    "|پیشنهادی|",
    "|آپارتمانی|",
    "|محل کار|",
    "|گل باغچه ای|",
    "|گل سمی|",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.mic,
                        size: 30,
                        color: Constants.blackColor,
                      ),
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Constants.blackColor,
                      ),
                      hintText: "جستجو...",
                      hintStyle: const TextStyle(
                        fontFamily: "iranSans",
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    style: const TextStyle(fontFamily: "iranSans"),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: 70,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: plantsCategory.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(
                      plantsCategory[index],
                      style: TextStyle(
                        fontFamily: "iranSans",
                        fontSize: 16,
                        fontWeight: selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.w300,
                        color: selectedIndex == index
                            ? Constants.primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              itemCount: plantsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: DetailPage(
                            plantId: plantsList[index].plantId,
                          ),
                          type: PageTransitionType.fade),
                    );
                  },
                  child: Container(
                    width: 230,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 50,
                          top: 50,
                          right: 50,
                          left: 50,
                          child: Image.asset(
                            plantsList[index].imageURL,
                            width: 100,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  plantsList[index].isFavorated =
                                      !plantsList[index].isFavorated;
                                });
                              },
                              icon: Icon(
                                plantsList[index].isFavorated == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Constants.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plantsList[index].category,
                                style: TextStyle(
                                  fontFamily: "iranSans",
                                  color: Colors.grey[300],
                                ),
                              ),
                              Text(
                                plantsList[index].plantName,
                                style: TextStyle(
                                  fontFamily: "iranSans",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[100],
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 13,
                          child: Container(
                            alignment: Alignment.center,
                            width: 60,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  plantsList[index]
                                      .price
                                      .toString()
                                      .farsiNumber,
                                  style: TextStyle(
                                    fontFamily: "Lalezar",
                                    fontWeight: FontWeight.bold,
                                    color: Constants.primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/PriceUnit-green.png",
                                  width: 25,
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(25),
            child: const Text(
              "گیاهان جدید",
              style: TextStyle(
                fontFamily: "Lalezar",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: size.height * 0.4,
            child: ListView.builder(
              itemCount: plantsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: DetailPage(
                            plantId: plantsList[index].plantId,
                          ),
                          type: PageTransitionType.fade),
                    );
                  },
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Constants.primaryColor.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 75,
                                child: Image.asset(plantsList[index].imageURL),
                              ),
                            ),
                            Positioned(
                              right: 85,
                              bottom: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plantsList[index].category,
                                    style: const TextStyle(
                                      fontFamily: 'iranSans',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    plantsList[index].plantName,
                                    style: TextStyle(
                                      fontFamily: 'iranSans',
                                      fontSize: 18,
                                      color: Constants.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Text(
                                plantsList[index].price.toString().farsiNumber,
                                style: TextStyle(
                                  fontFamily: 'Lalezar',
                                  fontSize: 18,
                                  color: Constants.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Image.asset(
                                "assets/images/PriceUnit-green.png",
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}

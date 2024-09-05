import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Pages/cart_page.dart';
import 'package:plant_app/Widgets/extension.dart';
import 'package:plant_app/consts/constants.dart';
import 'package:plant_app/models/plant.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantList[widget.plantId].isFavorated
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 130,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'اندازه گیاه',
                  style: TextStyle(
                    fontFamily: "Lalezar",
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  plantList[widget.plantId].size,
                  style: TextStyle(
                    fontFamily: "Lalezar",
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'رطوبت هوا',
                  style: TextStyle(
                    fontFamily: "Lalezar",
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  plantList[widget.plantId].humidity.toString().farsiNumber,
                  style: TextStyle(
                    fontFamily: "Lalezar",
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'دمای نگهداری',
                  style: TextStyle(
                    fontFamily: "Lalezar",
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  plantList[widget.plantId].temperature.farsiNumber,
                  style: TextStyle(
                    fontFamily: "Lalezar",
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 30,
            child: SizedBox(
              width: 220,
              height: 380,
              child: Image.asset(
                plantList[widget.plantId].imageURL,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(35),
                width: size.width,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 70),
                    Text(
                      plantList[widget.plantId].plantName,
                      style: TextStyle(
                        fontFamily: "Lalezar",
                        fontSize: 35,
                        color: Constants.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Constants.primaryColor,
                                size: 40,
                              ),
                              Text(
                                plantList[widget.plantId]
                                    .rating
                                    .toString()
                                    .farsiNumber,
                                style: TextStyle(
                                  fontFamily: "Lalezar",
                                  fontSize: 35,
                                  color: Constants.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/PriceUnit-green.png',
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          plantList[widget.plantId]
                              .price
                              .toString()
                              .farsiNumber,
                          style: TextStyle(
                            fontFamily: "Lalezar",
                            fontSize: 35,
                            color: Constants.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      plantList[widget.plantId].decription,
                      style: const TextStyle(
                        fontFamily: "iranSans",
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: CartPage(
                          addedToCartPlants: plantList
                              .where(
                                (element) => element.isSelected,
                              )
                              .toList()),
                      type: PageTransitionType.fade),
                );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: Constants.primaryColor.withOpacity(0.5),
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    bool isSelected =
                        toggleIsSelected(plantList[widget.plantId].isSelected);
                    plantList[widget.plantId].isSelected = isSelected;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(0.3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Constants.primaryColor,
                  ),
                  child: const Text(
                    "افزودن به سبد خرید",
                    style: TextStyle(
                      fontFamily: "Lalezar",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

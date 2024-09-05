import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/Pages/detail_page.dart';
import 'package:plant_app/Widgets/extension.dart';
import 'package:plant_app/consts/constants.dart';
import 'package:plant_app/models/plant.dart';

class NewPlantWidget extends StatelessWidget {
  final List<Plant> plantsList;
  final int index;
  const NewPlantWidget({
    super.key,
    required this.plantsList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
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
  }
}

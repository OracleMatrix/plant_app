import 'package:flutter/material.dart';
import 'package:plant_app/Widgets/plant_widget.dart';
import 'package:plant_app/consts/constants.dart';
import 'package:plant_app/models/plant.dart';

class FavoritPage extends StatefulWidget {
  final List<Plant> favortiedPlants;
  const FavoritPage({super.key, required this.favortiedPlants});

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.favortiedPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/favorited.png",
                    height: 100,
                  ),
                  Text(
                    "ظاهرا به هیچی علاقه نداشتی!",
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontFamily: "iranSans",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.favortiedPlants.length,
              itemBuilder: (context, index) {
                return NewPlantWidget(
                    plantsList: widget.favortiedPlants, index: index);
              },
            ),
    );
  }
}

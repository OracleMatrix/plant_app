import 'package:flutter/material.dart';
import 'package:plant_app/Widgets/extension.dart';
import 'package:plant_app/Widgets/plant_widget.dart';
import 'package:plant_app/consts/constants.dart';
import 'package:plant_app/models/plant.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;
  const CartPage({super.key, required this.addedToCartPlants});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _totalCost = 0;

  void _calculateTotalCost() {
    _totalCost = 0;
    for (var plant in widget.addedToCartPlants) {
      _totalCost += plant.price;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _calculateTotalCost();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: widget.addedToCartPlants.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/add-cart.png",
                      height: 100,
                    ),
                    Text(
                      "سبد خرید تار عنکبوت بسته!",
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
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.addedToCartPlants.length,
                      itemBuilder: (context, index) {
                        return NewPlantWidget(
                            plantsList: widget.addedToCartPlants, index: index);
                      },
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "جمع کل",
                                style: TextStyle(
                                  fontFamily: "Lalezar",
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          _totalCost.toString().farsiNumber,
                          style: TextStyle(
                            fontFamily: "Lalezar",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Constants.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/images/PriceUnit-green.png",
                          height: 22,
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

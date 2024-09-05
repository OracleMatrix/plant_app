import 'package:flutter/material.dart';
import 'package:plant_app/consts/constants.dart';

class ProfileOptions extends StatelessWidget {
  final IconData icon;
  final String text;
  const ProfileOptions({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Constants.blackColor,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: "iranSans",
          color: Constants.blackColor,
          fontSize: 18,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Constants.blackColor,
        size: 16,
      ),
    );
  }
}

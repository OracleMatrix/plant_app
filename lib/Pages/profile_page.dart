import 'package:flutter/material.dart';
import 'package:plant_app/Widgets/profile_options.dart';
import 'package:plant_app/consts/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            /*
            profile image
             */
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(0.5),
                  width: 5,
                ),
              ),
              child: const CircleAvatar(
                radius: 90,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/images/images.png",
                ),
              ),
            ),
            const SizedBox(height: 20),
            /*
            name
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/verified.png",
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "احسان محمدی",
                  style: TextStyle(
                    fontFamily: "iranSans",
                    color: Constants.blackColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            /*
            email
             */
            Text(
              "ehsanmohamadipoor@gmail.com",
              style: TextStyle(
                fontFamily: "iranSans",
                color: Constants.blackColor.withOpacity(0.5),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            /*
            profile options
             */
            const ProfileOptions(
              text: "تنظیمات",
              icon: Icons.settings,
            ),
            const SizedBox(height: 20),
            const ProfileOptions(
              text: "اطلاع رسانی ها",
              icon: Icons.notifications,
            ),
            const SizedBox(height: 20),
            const ProfileOptions(
              text: "شبکه های اجتماعی",
              icon: Icons.share,
            ),
            const SizedBox(height: 20),
            const ProfileOptions(
              text: "خروج",
              icon: Icons.exit_to_app,
            ),
          ],
        ),
      )),
    );
  }
}

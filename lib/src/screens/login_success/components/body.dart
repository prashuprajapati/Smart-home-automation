import 'package:flutter/material.dart';
import 'package:smarthome/default_button.dart';
import 'package:smarthome/src/screens/home_screen/home_screen.dart';
import 'package:smarthome/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = SizeConfig.screenWidth;
    double screenHeight = SizeConfig.screenHeight;
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, 
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.008), 
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.4, 
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}

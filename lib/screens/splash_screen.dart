import 'dart:async';

import 'package:demoproject/screens/dashboard.dart';
import 'package:demoproject/screens/login_screen.dart';
import 'package:demoproject/utils/constants/dimensions.dart';
import 'package:demoproject/utils/constants/images.dart';
import 'package:demoproject/utils/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KYELOGIN = "login";

  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KYELOGIN);
    Timer(
      const Duration(seconds: 2),
      () {
        if (isLoggedIn != null) {
          if (isLoggedIn) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthP = Dimensions.myWidthThis(context);
    double heightP = Dimensions.myHeightThis(context);
    double heightF = Dimensions.myHeightFThis(context);
    return Scaffold(
      body: Container(
        width: 393 * widthP,
        height: 852 * heightP,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstants.splashScreen),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: (400 * heightF)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ABYBABY",
                textAlign: TextAlign.center,
                style: TextStyles.primaryBold
                    .copyWith(color: Colors.black, fontSize: 50 * widthP),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

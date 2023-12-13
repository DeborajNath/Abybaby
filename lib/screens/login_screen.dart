import 'package:demoproject/screens/dashboard.dart';
import 'package:demoproject/screens/splash_screen.dart';
import 'package:demoproject/utils/constants/dimensions.dart';
import 'package:demoproject/utils/constants/images.dart';
import 'package:demoproject/utils/constants/textstyles.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double widthP = Dimensions.myWidthThis(context);
    double heightP = Dimensions.myHeightThis(context);
    double heightF = Dimensions.myHeightFThis(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('LOGIN PAGE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 100 * heightF, left: 10 * widthP, right: 10 * widthP),
        child: Column(
          children: [
            Container(
              width: 100 * widthP,
              height: 100 * heightP,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstants.logo), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 25 * widthP, top: 50 * heightF, right: 25 * widthP),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
                    style: TextStyles.primaryBold.copyWith(
                      color: Colors.black,
                      fontSize: (20 * widthP),
                    ),
                  ),
                  SizedBox(
                    height: 20 * heightF,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your Phone Number',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blue), // Change the color as needed
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the border radius
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * heightF,
                  ),
                  Text(
                    "Password",
                    style: TextStyles.primaryBold.copyWith(
                      color: Colors.black,
                      fontSize: (20 * widthP),
                    ),
                  ),
                  SizedBox(
                    height: 20 * heightF,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blue), // Change the color as needed
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the border radius
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30 * heightF,
            ),
            ElevatedButton(
                onPressed: () async {
                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool(SplashScreenState.KYELOGIN, true);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
                child: const Text('LOGIN'))
          ],
        ),
      ),
    );
  }
}

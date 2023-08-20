import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Widget _initialScreen;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      _determineInitialScreen();
    });
  }

  void _determineInitialScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasCompletedOnboarding =
        prefs.getBool('has_completed_onboarding') ?? false;

    if (!hasCompletedOnboarding) {
      //New Onboarding
      setState(() {
        _initialScreen = const OnBoardingScreen();
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _initialScreen),
      );
    } else {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: REdgeInsets.only(bottom: 150),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/onboarding 1.png"),
                fit: BoxFit.fill)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Falaj',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF577FCC),
                  fontSize: 60.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1.20,
                ),
              ),
              Text(
                'Discover the world heritage',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                  height: 1.30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

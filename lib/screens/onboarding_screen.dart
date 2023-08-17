import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_colors.dart';
import '../design_models/onboarding_model.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  bool hasShownOnboarding = false;

  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasShownOnboardingScreenTwo =
        prefs.getBool('hasShownOnboardingScreenTwo') ?? false;

    setState(() {
      hasShownOnboarding = hasShownOnboardingScreenTwo;
    });
  }

  Future<void> saveOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasShownOnboardingScreenTwo', true);
  }

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    checkOnboardingStatus();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return hasShownOnboarding ? const LoginScreen() : onBoardingScreen();
  }

  Widget onBoardingScreen() {
    return Scaffold(
      // backgroundColor: AppColors.colorWhiteHighEmp,
      body: Stack(alignment: Alignment.center, children: [
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: contents.length,
              itemBuilder: (_, i) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(contents[i].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.colorWhiteHighEmp,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          contents[i].subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.colorPrimary,
                              fontSize: 60.sp,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.colorWhiteHighEmp,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: REdgeInsets.only(top: 90, bottom: 24),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.colorPrimary,
                                ),
                                child: MaterialButton(
                                  onPressed: _nextPage, // Use the updated onPressed method
                                  child: Center(
                                    child: Icon(
                                      currentIndex == contents.length - 1
                                          ? Icons.arrow_forward_ios
                                          : Icons.arrow_forward_ios,
                                      color: AppColors.colorWhiteHighEmp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        Positioned(
          top: 560.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
                  (index) => buildDot(index, context),
            ),
          ),
        ),
      ]),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
        height: 8,
        margin: const EdgeInsets.all(2),
        width: currentIndex == index ? 29 : 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: currentIndex == index
                ? AppColors.colorPrimary
                : AppColors.colorWhiteHighEmp));
  }

  void _nextPage() async {
    if (currentIndex == contents.length - 1) {
      await saveOnboardingStatus();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

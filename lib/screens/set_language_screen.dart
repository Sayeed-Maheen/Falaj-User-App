import 'package:falaj_user_app/screens/login_screen.dart';
import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/app_constant.dart';
import '../controllers/language_controller.dart';

class SetLanguageScreen extends StatefulWidget {
  const SetLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SetLanguageScreen> createState() => _SetLanguageScreenState();
}

class _SetLanguageScreenState extends State<SetLanguageScreen> {
  void _saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBlueDark,
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Stack(children: [
          Positioned(
              top: 45.h,
              left: 20.w,
              right: 16.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      print('ok');
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Text(
                      'select_language'.tr,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ],
              )),
          Center(
            child: GetBuilder<LocalizationController>(
                builder: (localizationController) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: AppColors.colorBlueLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        localizationController.setLanguage(Locale(
                          AppConstants.languages[0].languageCode,
                          AppConstants.languages[0].countryCode,
                        ));
                        localizationController.setSelectedIndex(0);
                        _saveLanguage('en'); // Save 'en' as selected language
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Text(
                        'English',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 60.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: AppColors.colorBlueLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        localizationController.setLanguage(Locale(
                          AppConstants.languages[1].languageCode,
                          AppConstants.languages[1].countryCode,
                        ));
                        localizationController.setSelectedIndex(1);
                        _saveLanguage('ar'); // Save 'ar' as selected language
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Text(
                        'العربية',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ]),
      ),
    );
  }
}

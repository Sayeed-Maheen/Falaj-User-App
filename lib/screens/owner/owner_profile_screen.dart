import 'dart:io';

import 'package:falaj_user_app/screens/owner/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/app_constant.dart';
import '../../controllers/language_controller.dart';
import '../../utils/app_colors.dart';
import '../login_screen.dart';

class OwnerProfileScreen extends StatefulWidget {
  const OwnerProfileScreen({super.key});

  @override
  State<OwnerProfileScreen> createState() => _OwnerProfileScreenState();
}

class _OwnerProfileScreenState extends State<OwnerProfileScreen> {
  void _saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }

  String selectedImagePath = '';
  final double imageSize = 100;
  selectImageFromGallery() async {
    XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 10,
    );
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  bool pushNotificationStatus = false;

  void showOwnerLanguage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: AppColors.colorWhiteHighEmp,
        insetPadding: REdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.colorWhiteHighEmp,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "changeLanguage".tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.colorPrimary,
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: GetBuilder<LocalizationController>(
                      builder: (localizationController) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 45.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.colorPrimary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              localizationController.setLanguage(Locale(
                                AppConstants.languages[0].languageCode,
                                AppConstants.languages[0].countryCode,
                              ));
                              localizationController.setSelectedIndex(0);
                              _saveLanguage(
                                  'en'); // Save 'en' as selected language
                              Navigator.pop(context);
                            },
                            child: Text(
                              'English',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          height: 45.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.colorPrimary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              localizationController.setLanguage(Locale(
                                AppConstants.languages[1].languageCode,
                                AppConstants.languages[1].countryCode,
                              ));
                              localizationController.setSelectedIndex(1);
                              _saveLanguage(
                                  'ar'); // Save 'ar' as selected language
                              Navigator.pop(context);
                            },
                            child: Text(
                              'العربية',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.colorWhiteHighEmp,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          flexibleSpace: Container(
            color: AppColors.colorWhiteHighEmp, // Set a fixed color here
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            "profile".tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.colorBlackHighEmp,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: imageSize.h,
                    width: imageSize.w,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Center(
                          child: Container(
                            height: imageSize.h,
                            width: imageSize.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[100],
                            ),
                            child: Center(
                              child: selectedImagePath == ''
                                  ? SvgPicture.asset(
                                      'assets/images/profile.svg',
                                      height: 80.h,
                                      width: 80.w,
                                      color: AppColors.colorBlueLight,
                                    )
                                  : ClipOval(
                                      child: Image.file(
                                        File(selectedImagePath),
                                        height: imageSize,
                                        width: imageSize,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.only(right: 15, bottom: 0),
                          child: InkWell(
                            onTap: () async {
                              selectedImagePath = await selectImageFromGallery();
                              if (selectedImagePath != '') {
                                setState(() {});
                              }
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.colorPrimary),
                              child: const Icon(
                                Icons.edit,
                                size: 12,
                                color: AppColors.colorWhiteHighEmp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Saad Ahmed",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.colorBlackHighEmp,
                  ),
                ),
                SizedBox(height: 12.h),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32.h,
                    width: 106.w,
                    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.colorPrimaryLight,
                        borderRadius: BorderRadius.circular(48)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/edit.svg",
                          height: 16,
                          width: 16,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.colorPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  height: 24.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/notification.svg",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            "pushNotification".tr,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.colorBlackHighEmp,
                            ),
                          ),
                        ],
                      ),
                      FlutterSwitch(
                        activeColor: AppColors.colorPrimary,
                        inactiveColor: AppColors.colorGreyDark,
                        width: 40.w,
                        height: 20.h,
                        toggleSize: 20,
                        value: pushNotificationStatus,
                        borderRadius: 30.0,
                        onToggle: (val) {
                          setState(() {
                            pushNotificationStatus = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WalletScreen()));
                  },
                  child: SizedBox(
                    height: 24.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/wallet.svg",
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "wallet".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.colorBlackHighEmp,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.colorGreyDark,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () {
                    showOwnerLanguage();
                  },
                  child: SizedBox(
                    height: 24.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.g_translate),
                            SizedBox(width: 12.w),
                            Text(
                              "languageSettings".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.colorBlackHighEmp,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.colorGreyDark,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(height: 1.h),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 24.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/terms.svg",
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "termsOfUse".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.colorBlackHighEmp,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.colorGreyDark,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 24.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/privacy.svg",
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "privacy".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.colorBlackHighEmp,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.colorGreyDark,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 24.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/help.svg",
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              "helpFaq".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.colorBlackHighEmp,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.colorGreyDark,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginScreen()),
                        ModalRoute.withName('/'));
                  },
                  child: SizedBox(
                    height: 24.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/log_out.svg",
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "logOut".tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.colorRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

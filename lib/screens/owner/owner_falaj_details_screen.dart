import 'package:falaj_user_app/design_models/owner_bottom_nav.dart';
import 'package:falaj_user_app/screens/owner/request_sell_history_screen.dart';
import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../design_models/users_bottom_nav.dart';

class OwnerFalajDetailsScreen extends StatefulWidget {
  const OwnerFalajDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OwnerFalajDetailsScreen> createState() =>
      _OwnerFalajDetailsScreenState();
}

class _OwnerFalajDetailsScreenState extends State<OwnerFalajDetailsScreen> {
  bool showFullText = false;

  void showUserDialog() {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "reqForSale2".tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.colorPrimary,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'activeHours'.tr,
                  style: TextStyle(
                    color: const Color(0xFF202020),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 144.w,
                        child: TextFormField(
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                                .hasMatch(value!);
                            if (value.isEmpty) {
                              return "Enter Time";
                            } else if (emailValid) {
                              return "Enter Time";
                            }
                            return null;
                          },
                          style: const TextStyle(
                              color: AppColors.colorBlackHighEmp),
                          decoration: InputDecoration(
                            labelText: "Start Time",
                            labelStyle: TextStyle(
                                color: AppColors.colorBlackMidEmp,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp),
                            suffixIcon: const Icon(
                              Icons.check_circle_outline,
                              color: AppColors.colorBlackMidEmp,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: AppColors.colorGreyLight,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: AppColors.colorGreyLight,
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: AppColors.colorRed,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: AppColors.colorRed,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 144.w,
                        child: TextFormField(
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                                .hasMatch(value!);
                            if (value.isEmpty) {
                              return "Enter Time";
                            } else if (emailValid) {
                              return "Enter Time";
                            }
                            return null;
                          },
                          style: const TextStyle(
                              color: AppColors.colorBlackHighEmp),
                          decoration: InputDecoration(
                            labelText: "End Time",
                            labelStyle: TextStyle(
                                color: AppColors.colorBlackMidEmp,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp),
                            suffixIcon: const Icon(
                              Icons.check_circle_outline,
                              color: AppColors.colorBlackMidEmp,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: AppColors.colorGreyLight,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: AppColors.colorGreyLight,
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: AppColors.colorRed,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: AppColors.colorRed,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  'rentAmount'.tr,
                  style: TextStyle(
                    color: const Color(0xFF202020),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Enter Time";
                      } else if (emailValid) {
                        return "Enter Time";
                      }
                      return null;
                    },
                    style: const TextStyle(color: AppColors.colorBlackHighEmp),
                    decoration: InputDecoration(
                      labelText: "Amount",
                      labelStyle: TextStyle(
                          color: AppColors.colorBlackMidEmp,
                          fontWeight: FontWeight.w300,
                          fontSize: 14.sp),
                      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: AppColors.colorGreyLight,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: AppColors.colorGreyLight,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: AppColors.colorRed,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: AppColors.colorRed,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 48.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            color: AppColors.colorWhiteHighEmp,
                            border:
                                Border.all(width: 1, color: AppColors.colorRed),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.colorRed,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showCongratsDialog();
                      },
                      child: Container(
                        height: 48.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            color: AppColors.colorPrimary,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.colorWhiteHighEmp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCongratsDialog() {
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
                SvgPicture.asset(
                  "assets/images/congrats.svg",
                  height: 164.h,
                  width: 182.w,
                ),
                Text(
                  "congrats".tr,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.colorPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "reqSubmit".tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorBlackMidEmp,
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const OwnerBottomNav()),
                      ModalRoute.withName('/'),
                    );
                  },
                  child: Container(
                    height: 48.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.colorPrimary,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "close".tr,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.colorWhiteHighEmp,
                        ),
                      ),
                    ),
                  ),
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    const String initialText =
        "quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis."
        "Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis."
        "Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum."
        "Morbi a eleifend magna.";

    const String remainingText =
        "Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna.";

    return Scaffold(
      backgroundColor: AppColors.colorWhiteHighEmp,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/falaj_details_image.png",
                height: 230.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: 45,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.colorWhiteHighEmp,
                    ),
                  )),
              Positioned(
                top: 45,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.colorWhiteHighEmp,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
                padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
                children: [
                  Text(
                    "Al Yalham Falaj",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.colorBlackHighEmp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/location.svg",
                        height: 13,
                        width: 14,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "Ain Al-Jebah Al, Yeaben, Oman",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorLocation,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "ownedTime".tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.colorBlackHighEmp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled,
                        color: AppColors.colorGreen,
                        size: 24,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "01 PM - 11 PM",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorGreen,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 12, bottom: 16),
                    child: Divider(height: 1.h),
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.colorBlackHighEmp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    showFullText ? initialText + remainingText : initialText,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.colorBlackLowerEmp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFullText = !showFullText;
                      });
                    },
                    child: Text(
                      showFullText ? "Read less" : "Read more",
                      style: const TextStyle(color: AppColors.colorPrimary),
                    ),
                  ),
                ]),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: REdgeInsets.all(16),
        color: AppColors.colorWhiteHighEmp,
        child: InkWell(
          onTap: () {
            showUserDialog();
          },
          child: Container(
            height: 48.h,
            width: 195.w,
            decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                "reqForSale".tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.colorWhiteHighEmp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

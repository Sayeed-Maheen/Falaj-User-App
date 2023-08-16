import 'package:falaj_user_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'utils/app_colors.dart';

class ScrapCodes extends StatelessWidget {
  const ScrapCodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Column(
      children: [
        //backgroundColor: AppColors.colorWhiteHighEmp,
        AppBar(
          flexibleSpace: Container(
              //color: AppColors.colorWhiteHighEmp, // Set a fixed color here
              ),
          titleSpacing: -1,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              //  color: AppColors.colorBlackHighEmp,
            ),
          ),
          title: Text(
            "text",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              //color: AppColors.colorBlackHighEmp,
            ),
          ),
        ),
        Text(
          "Terms of use  & Privacy Policy",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.colorBlackHighEmp,
          ),
        ),
        SvgPicture.asset(
          "assets/images/appLogo.svg",
          height: 87.h,
          width: 96.w,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 24.sp,
              //  color: AppColors.colorPrimary,
            ),
            children: const [
              TextSpan(
                text: "WALL",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: "PERS",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(width: 16.w),
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: const SingleChildScrollView(),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(8),
              minimumSize: const Size(50, 20),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          child: Text(
            'forgotPassword',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              // color: AppColors.colorPrimary,
            ),
          ),
        ),
        Text(
          "\u2022",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            //color: AppColors.colorBlackLowEmp,
          ),
        ),
        Image.asset(
          "assets/images/drop1.png",
          height: 70.h,
          width: 73.w,
          fit: BoxFit.fill,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        ),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen()),
                ModalRoute.withName('/'));
          },
          child: Container(
            height: 45.h,
            width: 160.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.colorPrimaryDark),
            child: Center(
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.colorWhiteHighEmp,
                ),
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          elevation: 3,
          shadowColor: AppColors.colorGreyLightest,
          child: Container(
            width: double.infinity,
            margin: REdgeInsets.symmetric(horizontal: 16),
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.colorWhiteHighEmp,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  "Select your pickup location",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.colorBlackHighEmp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

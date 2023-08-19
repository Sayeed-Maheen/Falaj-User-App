import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../design_models/my_bottom_nav.dart';
import '../utils/app_colors.dart';

class SelectPaymentMethodCongratsScreen extends StatelessWidget {
  const SelectPaymentMethodCongratsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhiteHighEmp,
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(height: 24.h),
          Image.asset(
            "assets/images/gif.gif",
            height: 306,
            width: 306,
          ),
          Text(
            'Congrats!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.colorGreen,
              fontSize: 36.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Your payment went successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.colorGreyDark,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      )),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const MyBottomNav()),
              ModalRoute.withName('/'));
        },
        child: Container(
          height: 46.h,
          width: double.infinity,
          margin: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
          decoration: BoxDecoration(
              color: AppColors.colorPrimary,
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Text(
              'Back to Home',
              style: TextStyle(
                color: AppColors.colorWhiteHighEmp,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

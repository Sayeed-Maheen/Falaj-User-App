import 'package:falaj_user_app/screens/owner/payout_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhiteHighEmp,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        flexibleSpace: Container(
          color: AppColors.colorWhiteHighEmp, // Set a fixed color here
        ),
        titleSpacing: -1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            //  color: AppColors.colorBlackHighEmp,
          ),
        ),
        title: const Text(
          "Wallet",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.colorBlackHighEmp,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(height: 16.h),
          Container(
            height: 154.h,
            width: double.infinity,
            padding: REdgeInsets.all(16),
            margin: REdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.colorGreen,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Total Earned',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OMR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      '300',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
            ],),
          )
        ],
      )),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: REdgeInsets.all(16),
        color: AppColors.colorWhiteHighEmp,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PayoutRequestScreen()));
          },
          child: Container(
            height: 48.h,
            width: 195.w,
            decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                "Payout Request",
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

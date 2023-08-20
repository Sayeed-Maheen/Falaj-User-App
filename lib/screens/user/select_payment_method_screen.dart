import 'package:falaj_user_app/screens/user/select_payment_method_congrats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  const SelectPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<SelectPaymentMethodScreen> createState() =>
      _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {
  int _radioSelected = 1;
  late String _radioVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhiteHighEmp,
      appBar: AppBar(
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
          "Select Payment Method",
          style: TextStyle(
              color: AppColors.colorBlackHighEmp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin: REdgeInsets.all(16),
            padding: REdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.colorGrey2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subscription",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.colorText,
                      ),
                    ),
                    Text(
                      "1 month",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorText2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.colorText,
                      ),
                    ),
                    Text(
                      "\$16.99",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorText2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tax",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.colorText,
                      ),
                    ),
                    Text(
                      "\$0.0",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorText2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total amount",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.colorText,
                      ),
                    ),
                    Text(
                      "\$16.99",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorText2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              "Selected Payment Method",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.colorBlackHighEmp,
              ),
            ),
          ),
          Container(
            margin: REdgeInsets.symmetric(horizontal: 16),
            padding: REdgeInsets.only(top: 12, bottom: 12, left: 12),
            decoration: BoxDecoration(
              color: AppColors.colorGrey2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/payment.png",
                  height: 62,
                  width: 62,
                  fit: BoxFit.fill,
                ),
                Radio(
                  value: 1,
                  groupValue: _radioSelected,
                  activeColor: AppColors.colorPrimary,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = value!;
                      _radioVal = 'male';
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SelectPaymentMethodCongratsScreen()));
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
              'Continue',
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

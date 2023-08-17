import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<String> _images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhiteHighEmp,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 42.h,
            width: double.infinity,
            margin: REdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/photo.png",
                  height: 42,
                  width: 42,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 8.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorBlackLowEmp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Saad Ahmed 👋",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorBlackHighEmp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [

                SizedBox(height: 12.h),
                Padding(
                  padding: REdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All the Falaj",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorBlackHighEmp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            //padding: const EdgeInsets.all(8),
                            minimumSize: const Size(50, 20),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.colorPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                ...List.generate(
                  _images.length,
                      (index) => Container(child: Image.asset(_images[index])),
                ),


              ],
            ),
          ),
        ],
      )),
    );
  }
}

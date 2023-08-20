import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import 'falaj_details_screen.dart';

class MyFalajScreen extends StatelessWidget {
  MyFalajScreen({Key? key}) : super(key: key);

  final List<String> _images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img1.png',
    'assets/images/img2.png',
  ];

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
          "My Falaj",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.colorBlackHighEmp,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          ...List.generate(
            _images.length,
            (index) => Card(
              shadowColor: AppColors.colorGrey,
              margin: REdgeInsets.only(left: 16, right: 16, bottom: 12),
              color: AppColors.colorWhiteHighEmp,
              elevation: 3,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FalajDetailsScreen()));
                },
                child: Container(
                    padding: REdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.colorWhiteHighEmp,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Image.asset(
                          _images[index],
                          height: 70,
                          width: 70,
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Al Yalham Falaj",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colorBlackHighEmp,
                                  ),
                                ),
                                SizedBox(width: 45.w),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time_filled,
                                        color: AppColors.colorGreen, size: 18),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "4PM-6PM",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.colorGreen,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/location.svg",
                                  height: 12,
                                  width: 12,
                                  color: AppColors.colorLocation,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "Ain Al-Jebah Al, Yeaben",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.colorBlackLowEmp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

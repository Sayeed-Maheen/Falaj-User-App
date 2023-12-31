import 'package:falaj_user_app/screens/user/select_payment_method_screen.dart';
import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class FalajDetailsScreen extends StatefulWidget {
  const FalajDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FalajDetailsScreen> createState() => _FalajDetailsScreenState();
}

class _FalajDetailsScreenState extends State<FalajDetailsScreen> {
  bool showFullText = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );

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
                  child: SizedBox(
                    width: 360.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.colorWhiteHighEmp,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppColors.colorWhiteHighEmp,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
            child: ListView(
                padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Royale President Falaj",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.colorBlackHighEmp,
                        ),
                      ),
                      Padding(
                        padding: REdgeInsets.only(top: 2),
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/message.svg",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ],
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
                    "availableTime".tr,
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
                        "01 PM - 03 PM",
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
                  ReadMoreText(
                    "quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum.",
                    trimLines: 2,
                    colorClickableText: AppColors.colorPrimary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read less',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.colorBlackLowerEmp,
                    ),
                  ),
                ]),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        width: double.infinity,
        padding: REdgeInsets.all(16),
        color: AppColors.colorWhiteHighEmp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SelectPaymentMethodScreen()));
              },
              child: Container(
                height: 48.h,
                width: 195.w,
                decoration: BoxDecoration(
                    color: AppColors.colorPrimary,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Text(
                    "rentNow".tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.colorWhiteHighEmp,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "\$30",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.colorGreen,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  "season".tr,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorBlackLowEmp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

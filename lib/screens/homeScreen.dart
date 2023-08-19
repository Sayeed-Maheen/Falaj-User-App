import 'package:falaj_user_app/screens/falaj_details_screen.dart';
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
                SizedBox(height: 12.h),
                ...List.generate(
                  _images.length,
                  (index) => Card(
                    shadowColor: AppColors.colorGrey,
                    margin: REdgeInsets.only(left: 16, right: 16, bottom: 12),
                    color: AppColors.colorWhiteHighEmp,
                    elevation: 3,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const FalajDetailsScreen()));
                      },
                      child: Container(
                          padding:
                              REdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Al Yalham Falaj",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colorBlackHighEmp,
                                        ),
                                      ),
                                      SizedBox(width: 55.w),
                                      Row(
                                        children: [
                                          const Icon(Icons.access_time_filled,
                                              color: AppColors.colorGreen,
                                              size: 18),
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
                                  SizedBox(height: 2.h),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: AppColors.colorBlackLowEmp,
                                          size: 20),
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
                                  SizedBox(height: 6.h),
                                  Row(
                                    children: [
                                      Text(
                                        "﷼30 ",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.colorGreen,
                                        ),
                                      ),
                                      Text(
                                        "/month",
                                        style: TextStyle(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.colorBlackDarkerEmp,
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
            ),
          ),
        ],
      )),
    );
  }
}

import 'package:falaj_user_app/design_models/users_bottom_nav.dart';
import 'package:falaj_user_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../design_models/remember_me_model.dart';
import '../utils/app_colors.dart';
import '../utils/my_button.dart';

class CustomSegmentedControl extends StatelessWidget {
  final List<String> segments;
  final int currentIndex;
  final ValueChanged<int> onSegmentTapped;
  final double tabWidth; // Add a property for the tab width
  final double spacing; // Add a property for the spacing between tabs
  final BorderRadius borderRadius;

  CustomSegmentedControl({
    required this.segments,
    required this.currentIndex,
    required this.onSegmentTapped,
    this.tabWidth = 80, // Set the default width
    this.spacing = 12, // Set the default spacing
    this.borderRadius = const BorderRadius.all(Radius.circular(50)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Row(
        children: List.generate(
          segments.length,
          (index) => Row(
            children: [
              GestureDetector(
                onTap: () => onSegmentTapped(index),
                child: Container(
                  height: 32.h,
                  width: tabWidth.w, // Use the tab width property here
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColors.colorPrimary
                        : Colors.transparent,
                    borderRadius:
                        currentIndex == index ? borderRadius : borderRadius,
                    border: Border.all(
                      color: currentIndex != index
                          ? AppColors.colorGreyLighter
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      segments[index],
                      style: TextStyle(
                        color: currentIndex == index
                            ? AppColors.colorWhiteHighEmp
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: spacing.w), // Add spacing between tabs
            ],
          ),
        ),
      ),
    );
  }
}

class RentedFalajScreen extends StatefulWidget {
  const RentedFalajScreen({Key? key}) : super(key: key);

  @override
  State<RentedFalajScreen> createState() => _RentedFalajScreenState();
}

class _RentedFalajScreenState extends State<RentedFalajScreen> {
  int _currentSelection = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentSelection);
  }

  final List<String> _images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];
  final List<String> _text = [
    'Paid',
    'Paid',
    'Due',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhiteHighEmp,
      appBar: AppBar(
        flexibleSpace: Container(
          color: AppColors.colorWhiteHighEmp, // Set a fixed color here
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "Rented Falaj’s",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.colorBlackHighEmp,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            CustomSegmentedControl(
              segments: const ["Ongoing", "Cancelled"],
              currentIndex: _currentSelection,
              onSegmentTapped: (index) {
                setState(() {
                  _currentSelection = index;
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                });
              },
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentSelection = index;
                  });
                },
                children: [
                  Column(
                    children: [
                      ...List.generate(
                        _images.length,
                        (index) => Card(
                          shadowColor: AppColors.colorGrey,
                          margin:
                              REdgeInsets.only(left: 16, right: 16, bottom: 12),
                          color: AppColors.colorWhiteHighEmp,
                          elevation: 3,
                          child: Container(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              color:
                                                  AppColors.colorBlackHighEmp,
                                            ),
                                          ),
                                          SizedBox(width: 45.w),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.access_time_filled,
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
                                            "﷼25 ",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.colorGreen,
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Container(
                                            padding: REdgeInsets.symmetric(
                                                horizontal: 6, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: index == _text.length - 1
                                                    ? AppColors.colorGrey
                                                    : AppColors.colorGreenLight,
                                                borderRadius:
                                                    BorderRadius.circular(48)),
                                            child: Text(
                                              _text[index],
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600,
                                                color: index == _text.length - 1
                                                    ? AppColors.colorBlackMidEmp
                                                    : AppColors.colorGreen,
                                              ),
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
                    ],
                  ),
                  Column(
                    children: [
                      ...List.generate(
                        _images.length,
                        (index) => Card(
                          shadowColor: AppColors.colorGrey,
                          margin:
                              REdgeInsets.only(left: 16, right: 16, bottom: 12),
                          color: AppColors.colorWhiteHighEmp,
                          elevation: 3,
                          child: Container(
                              padding: REdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              color:
                                                  AppColors.colorBlackHighEmp,
                                            ),
                                          ),
                                          SizedBox(width: 45.w),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.access_time_filled,
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
                                            "﷼25 ",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.colorGreen,
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Container(
                                            padding: REdgeInsets.symmetric(
                                                horizontal: 6, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: index == _text.length - 1
                                                    ? AppColors.colorGrey
                                                    : AppColors.colorGreenLight,
                                                borderRadius:
                                                    BorderRadius.circular(48)),
                                            child: Text(
                                              _text[index],
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600,
                                                color: index == _text.length - 1
                                                    ? AppColors.colorBlackMidEmp
                                                    : AppColors.colorGreen,
                                              ),
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

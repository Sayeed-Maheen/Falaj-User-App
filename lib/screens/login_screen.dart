import 'package:falaj_user_app/design_models/my_bottom_nav.dart';
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
  final BorderRadius borderRadius;

  CustomSegmentedControl({
    required this.segments,
    required this.currentIndex,
    required this.onSegmentTapped,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 16),
      padding: REdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: AppColors.colorGrey,
      ),
      child: Row(
        children: List.generate(
          segments.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () => onSegmentTapped(index),
              child: Container(
                height: currentIndex == index ? 45.h : 57.h,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? AppColors
                          .colorWhiteHighEmp // Change to your desired selected color
                      : Colors.transparent,
                  borderRadius:
                      currentIndex == index ? borderRadius : BorderRadius.zero,
                ),
                child: Center(
                  child: Text(
                    segments[index],
                    style: TextStyle(
                      color: currentIndex == index
                          ? AppColors.colorPrimary
                          : Colors
                              .black, // Change to your desired unselected text color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _currentSelection = 0;
  late PageController _pageController;

  final _formField = GlobalKey<FormState>();
  final ownerEmailController = TextEditingController();
  final ownerPasswordController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  var userObscureText = true;
  var ownerObscureText = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhiteHighEmp,
      body: SafeArea(
        child: Form(
          key: _formField,
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.only(top: 76),
                child: Center(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.colorBlackHighEmp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.only(top: 4),
                child: Center(
                  child: Text(
                    "To your favorite Book app.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.colorBlackLowEmp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomSegmentedControl(
                segments: const ["Owner", "User"],
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
              SizedBox(height: 40.h),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentSelection = index;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Your Email",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colorBlackHighEmp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                width: double.infinity,
                                margin: REdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  controller: ownerEmailController,
                                  validator: (value) {
                                    bool emailValid = RegExp(
                                            r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                                        .hasMatch(value!);
                                    if (value.isEmpty) {
                                      return "Enter Email";
                                    } else if (emailValid) {
                                      return "Enter valid Email";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                      color: AppColors.colorBlackHighEmp),
                                  decoration: InputDecoration(
                                    hintText: "mail@example.com",
                                    hintStyle: TextStyle(
                                        color: AppColors.colorBlackMidEmp,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.sp),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        16, 16, 16, 16),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorGreyLight,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorGreyLight,
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorRed,
                                        width: 1,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorRed,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Your Password",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colorBlackHighEmp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                width: double.infinity,
                                margin: REdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  controller: ownerPasswordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Password";
                                    } else if (ownerPasswordController
                                            .text.length <
                                        6) {
                                      return "Password length should be more than 6 characters";
                                    }
                                  },
                                  style: const TextStyle(
                                      color: AppColors.colorBlackHighEmp),
                                  obscureText: ownerObscureText,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: AppColors.colorBlackMidEmp,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.sp),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          ownerObscureText = !ownerObscureText;
                                        });
                                      },
                                      child: ownerObscureText
                                          ? const Icon(Icons.visibility_off,
                                              color: AppColors.colorPrimary,
                                              size: 20)
                                          : const Icon(
                                              Icons.visibility_outlined,
                                              color: AppColors.colorPrimary,
                                              size: 20),
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        16, 16, -4, 16),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorGreyLight,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorGreyLight,
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorRed,
                                        width: 1,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorRed,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const RememberMeModel(),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(8),
                                          minimumSize: const Size(50, 20),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap),
                                      child: Text(
                                        'Forgot password?',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colorRed,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 32.h),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: MyButton(
                                    onPressed: () {
                                      if (_formField.currentState!.validate()) {
                                        ownerEmailController.clear();
                                        ownerPasswordController.clear();
                                        Navigator.pushAndRemoveUntil<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  const MyBottomNav()),
                                          ModalRoute.withName('/'),
                                        );
                                      }
                                    },
                                    text: "Sign In"),
                              ),
                              SizedBox(height: 64.h),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don’t have any account? ",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.colorBlackHighEmp,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignupScreen()));
                                      },
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(8),
                                          minimumSize: const Size(50, 20),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap),
                                      child: Text(
                                        'Register now',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colorPrimary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Your Email",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colorBlackHighEmp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                width: double.infinity,
                                margin: REdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  controller: userEmailController,
                                  validator: (value) {
                                    bool emailValid = RegExp(
                                            r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                                        .hasMatch(value!);
                                    if (value.isEmpty) {
                                      return "Enter Email";
                                    } else if (emailValid) {
                                      return "Enter valid Email";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                      color: AppColors.colorBlackHighEmp),
                                  decoration: InputDecoration(
                                    hintText: "mail@example.com",
                                    hintStyle: TextStyle(
                                        color: AppColors.colorBlackMidEmp,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.sp),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        16, 16, 16, 16),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorGreyLight,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorGreyLight,
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorRed,
                                        width: 1,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorRed,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Your Password",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colorBlackHighEmp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                width: double.infinity,
                                margin: REdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  controller: userPasswordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Password";
                                    } else if (ownerPasswordController
                                            .text.length <
                                        6) {
                                      return "Password length should be more than 6 characters";
                                    }
                                  },
                                  style: const TextStyle(
                                      color: AppColors.colorBlackHighEmp),
                                  obscureText: userObscureText,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: AppColors.colorBlackMidEmp,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.sp),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          userObscureText = !userObscureText;
                                        });
                                      },
                                      child: userObscureText
                                          ? const Icon(Icons.visibility_off,
                                              color: AppColors.colorPrimary,
                                              size: 20)
                                          : const Icon(
                                              Icons.visibility_outlined,
                                              color: AppColors.colorPrimary,
                                              size: 20),
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        16, 16, -4, 16),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorGreyLight,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorGreyLight,
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorRed,
                                        width: 1,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: AppColors.colorRed,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const RememberMeModel(),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(8),
                                          minimumSize: const Size(50, 20),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap),
                                      child: Text(
                                        'Forgot password?',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colorRed,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 32.h),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: MyButton(
                                    onPressed: () {
                                      if (_formField.currentState!.validate()) {
                                        userEmailController.clear();
                                        userPasswordController.clear();
                                        Navigator.pushAndRemoveUntil<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  const MyBottomNav()),
                                          ModalRoute.withName('/'),
                                        );
                                      }
                                    },
                                    text: "Sign In"),
                              ),
                              SizedBox(height: 64.h),
                              Padding(
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don’t have any account? ",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.colorBlackHighEmp,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignupScreen()));
                                      },
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(8),
                                          minimumSize: const Size(50, 20),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap),
                                      child: Text(
                                        'Register now',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colorPrimary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

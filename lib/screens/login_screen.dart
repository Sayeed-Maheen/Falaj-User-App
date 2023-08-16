import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/my_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscureText = true;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
            Container(
              height: 57.h,
              decoration: BoxDecoration(
                  color: AppColors.colorGrey,
                  borderRadius: BorderRadius.circular(16)),
              margin:
                  REdgeInsets.only(top: 24, right: 16, left: 16, bottom: 40),
              padding: REdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              child: TabBar(
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    color: AppColors.colorWhiteHighEmp),
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.colorBlackHighEmp,
                labelStyle: const TextStyle(),
                labelColor: AppColors.colorPrimary,
                tabs: const [
                  Tab(
                      child: Text(
                    "Owner",
                  )),
                  Tab(
                      child: Text(
                    "User",
                  )),
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Container(
              width: double.infinity,
              margin: REdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: emailController,
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
                style: const TextStyle(color: AppColors.colorBlackHighEmp),
                decoration: InputDecoration(
                  labelText: "mail@example.com",
                  labelStyle: TextStyle(
                      color: AppColors.colorBlackMidEmp,
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp),
                  contentPadding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
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
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              margin: REdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Password";
                  } else if (passwordController.text.length < 6) {
                    return "Password length should be more than 6 characters";
                  }
                },
                style: const TextStyle(color: AppColors.colorBlackHighEmp),
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                      color: AppColors.colorBlackMidEmp,
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: obscureText
                        ? const Icon(Icons.visibility_off,
                            color: AppColors.colorPrimary, size: 20)
                        : const Icon(Icons.visibility_outlined,
                            color: AppColors.colorPrimary, size: 20),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(16, 20, -4, 20),
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
            SizedBox(height: 24.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: MyButton(
                  onPressed: () {
                    if (_formField.currentState!.validate()) {
                      emailController.clear();
                      passwordController.clear();
                      Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomeScreen()),
                        ModalRoute.withName('/'),
                      );
                    }
                  },
                  text: "Sign In"),
            ),
          ],
        ),
      )),
    );
  }
}

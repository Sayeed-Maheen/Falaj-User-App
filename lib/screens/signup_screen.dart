import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:falaj_user_app/design_models/owner_bottom_nav.dart';
import 'package:falaj_user_app/design_models/users_bottom_nav.dart';
import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int _currentSelection = 0;
  late PageController _pageController;
  final _formField = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userCreatePasswordController = TextEditingController();
  final userConfirmPasswordController = TextEditingController();
  var userObscureText = true;
  var userObscureText2 = true;

  final ownerNameController = TextEditingController();
  final ownerEmailController = TextEditingController();
  final ownerCreatePasswordController = TextEditingController();
  final ownerConfirmPasswordController = TextEditingController();
  var ownerObscureText = true;
  var ownerObscureText2 = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentSelection);
  }

  void showOwnerDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: AppColors.colorWhiteHighEmp,
        insetPadding: REdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.colorWhiteHighEmp,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/congrats.svg",
                  height: 164.h,
                  width: 182.w,
                ),
                Text(
                  "Submitted",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.colorPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Your account was created successfully",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorBlackMidEmp,
                  ),
                ),
                SizedBox(height: 24.h),
                MyButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const OwnerBottomNav()),
                        ModalRoute.withName('/'),
                      );
                    },
                    text: "Continue to Homepage")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showUserDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: AppColors.colorWhiteHighEmp,
        insetPadding: REdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.colorWhiteHighEmp,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/congrats.svg",
                  height: 164.h,
                  width: 182.w,
                ),
                Text(
                  "Congratulation",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.colorPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Your account was created successfully",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorBlackMidEmp,
                  ),
                ),
                SizedBox(height: 24.h),
                MyButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const UsersBottomNav()),
                        ModalRoute.withName('/'),
                      );
                    },
                    text: "Continue to Homepage")
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> falajName = [
    'Name 1',
    'Name 2',
    'Name 3',
  ];
  String? selectedFalajName;

  String _filePath = 'No file selected';

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
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
                  "Sign Up to",
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
                  "Your favorite Book app.",
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
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentSelection = index;
                  });
                },
                children: [
                  SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40.h),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Your Name",
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
                              controller: ownerNameController,
                              validator: (value) {
                                bool emailValid = RegExp(
                                        r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                                    .hasMatch(value!);
                                if (value.isEmpty) {
                                  return "Enter Name";
                                } else if (emailValid) {
                                  return "Enter Name";
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  color: AppColors.colorBlackHighEmp),
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    color: AppColors.colorBlackMidEmp,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                              "Create Password",
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
                              controller: ownerCreatePasswordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (ownerCreatePasswordController
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
                                      : const Icon(Icons.visibility_outlined,
                                          color: AppColors.colorPrimary,
                                          size: 20),
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 16, -4, 16),
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
                              "Rewrite Password",
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
                              controller: ownerConfirmPasswordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (ownerCreatePasswordController
                                        .text.length <
                                    6) {
                                  return "Password length should be more than 6 characters";
                                }
                              },
                              style: const TextStyle(
                                  color: AppColors.colorBlackHighEmp),
                              obscureText: ownerObscureText2,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: AppColors.colorBlackMidEmp,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ownerObscureText2 = !ownerObscureText2;
                                    });
                                  },
                                  child: ownerObscureText2
                                      ? const Icon(Icons.visibility_off,
                                          color: AppColors.colorPrimary,
                                          size: 20)
                                      : const Icon(Icons.visibility_outlined,
                                          color: AppColors.colorPrimary,
                                          size: 20),
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 16, -4, 16),
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
                              "Falaj name",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorBlackHighEmp,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: 46.h,
                            width: double.infinity,
                            margin: REdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.colorGrey,
                              ),
                            ),
                            child: FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    buttonStyleData: const ButtonStyleData(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 40,
                                      width: 140,
                                    ),
                                    hint: Text(
                                      'Select one',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: falajName
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedFalajName,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedFalajName = value as String;
                                        state.didChange(value);
                                      });
                                    },
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Legal Documents",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorBlackHighEmp,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            child: InkWell(
                              onTap: _pickFile,
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                dashPattern: const [5, 5],
                                color: AppColors.colorPrimary,
                                strokeWidth: 1.5,
                                child: Container(
                                  height: 71.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      "Upload here",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.colorPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 12.h),
                          // Text(
                          //   _filePath,
                          //   style: const TextStyle(
                          //       fontSize: 16, fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(height: 32.h),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            child: MyButton(
                                onPressed: () {
                                  if (_formField.currentState!.validate()) {
                                    ownerNameController.clear();
                                    ownerEmailController.clear();
                                    ownerCreatePasswordController.clear();
                                    ownerConfirmPasswordController.clear();
                                    showOwnerDialog();
                                  }
                                },
                                text: "Sign In"),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40.h),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Your Name",
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
                              controller: userNameController,
                              validator: (value) {
                                bool emailValid = RegExp(
                                        r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                                    .hasMatch(value!);
                                if (value.isEmpty) {
                                  return "Enter Name";
                                } else if (emailValid) {
                                  return "Enter Name";
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  color: AppColors.colorBlackHighEmp),
                              decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    color: AppColors.colorBlackMidEmp,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                              "Create Password",
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
                              controller: userCreatePasswordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (userCreatePasswordController
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
                                      : const Icon(Icons.visibility_outlined,
                                          color: AppColors.colorPrimary,
                                          size: 20),
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 16, -4, 16),
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
                              "Rewrite Password",
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
                              controller: userConfirmPasswordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (userCreatePasswordController
                                        .text.length <
                                    6) {
                                  return "Password length should be more than 6 characters";
                                }
                              },
                              style: const TextStyle(
                                  color: AppColors.colorBlackHighEmp),
                              obscureText: userObscureText2,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: AppColors.colorBlackMidEmp,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      userObscureText2 = !userObscureText2;
                                    });
                                  },
                                  child: userObscureText2
                                      ? const Icon(Icons.visibility_off,
                                          color: AppColors.colorPrimary,
                                          size: 20)
                                      : const Icon(Icons.visibility_outlined,
                                          color: AppColors.colorPrimary,
                                          size: 20),
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 16, -4, 16),
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
                          SizedBox(height: 32.h),
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            child: MyButton(
                                onPressed: () {
                                  if (_formField.currentState!.validate()) {
                                    userNameController.clear();
                                    userEmailController.clear();
                                    userCreatePasswordController.clear();
                                    userConfirmPasswordController.clear();
                                    showUserDialog();
                                  }
                                },
                                text: "Sign In"),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:falaj_user_app/screens/user/select_payment_method_congrats_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        title: Text(
          "selectPaymentMethod".tr,
          style: const TextStyle(
              color: AppColors.colorBlackHighEmp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "amount".tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.colorBlackHighEmp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 45.h,
            width: double.infinity,
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: REdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: AppColors.colorGreyLight,
                )),
            child: Text(
              "30",
              style: TextStyle(
                  color: AppColors.colorBlackMidEmp,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp),
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "paymentMethod".tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.colorBlackHighEmp,
              ),
            ),
          ),
          //SizedBox(height: 8.h),
          Row(
            children: [
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
              //SizedBox(width: 12.w),
              Text(
                "bank".tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.colorBlackHighEmp,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "legalName".tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.colorBlackHighEmp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 45.h,
            width: double.infinity,
            margin: REdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              //controller: ownerEmailController,
              validator: (value) {
                bool emailValid = RegExp(
                        r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                    .hasMatch(value!);
                if (value.isEmpty) {
                  return "Enter Full Legal Name ";
                } else if (emailValid) {
                  return "Enter Full Legal Name ";
                }
                return null;
              },
              style: const TextStyle(color: AppColors.colorBlackHighEmp),
              decoration: InputDecoration(
                hintText: "Full Legal Name ",
                hintStyle: TextStyle(
                    color: AppColors.colorBlackMidEmp,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp),
                contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
              "receiverAccount".tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.colorBlackHighEmp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 45.h,
            width: double.infinity,
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: REdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: AppColors.colorGreyLight,
                )),
            child: Text(
              "123456789",
              style: TextStyle(
                  color: AppColors.colorBlackMidEmp,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp),
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "senderAccount".tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.colorBlackHighEmp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 45.h,
            width: double.infinity,
            margin: REdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              //controller: ownerEmailController,
              validator: (value) {
                bool emailValid = RegExp(
                        r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                    .hasMatch(value!);
                if (value.isEmpty) {
                  return "Enter Account Number";
                } else if (emailValid) {
                  return "Enter Account Number";
                }
                return null;
              },
              style: const TextStyle(color: AppColors.colorBlackHighEmp),
              decoration: InputDecoration(
                hintText: "Account Number",
                hintStyle: TextStyle(
                    color: AppColors.colorBlackMidEmp,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp),
                contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
              "transactionDocument".tr,
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "uploadHere".tr,
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
          SizedBox(height: 16.h),
        ],
      )),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const SelectPaymentMethodCongratsScreen()));
        },
        child: Container(
          height: 46.h,
          width: double.infinity,
          margin: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
              color: AppColors.colorPrimary,
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Text(
              'continue'.tr,
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

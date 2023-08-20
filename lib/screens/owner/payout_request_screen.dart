import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:falaj_user_app/design_models/owner_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class PayoutRequestScreen extends StatefulWidget {
  const PayoutRequestScreen({Key? key}) : super(key: key);

  @override
  State<PayoutRequestScreen> createState() => _PayoutRequestScreenState();
}

class _PayoutRequestScreenState extends State<PayoutRequestScreen> {
  final List<String> paymentMethod = [
    'Bank',
    'Card',
  ];
  String? selectedPaymentMethod;
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
          "Payout Request",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.colorBlackHighEmp,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(height: 16.h),
          Container(
            height: 154.h,
            width: double.infinity,
            padding: REdgeInsets.all(16),
            margin: REdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: AppColors.colorGreen,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Earned',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OMR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      '300',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 48.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Enter Amount",
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
              //controller: ownerEmailController,
              validator: (value) {
                bool emailValid = RegExp(
                        r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                    .hasMatch(value!);
                if (value.isEmpty) {
                  return "Enter Amount";
                } else if (emailValid) {
                  return "Enter Amount";
                }
                return null;
              },
              style: const TextStyle(color: AppColors.colorBlackHighEmp),
              decoration: InputDecoration(
                hintText: "Enter Amount",
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
              "Payment Method",
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
                      padding: EdgeInsets.symmetric(horizontal: 16),
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
                    items: paymentMethod
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
                    value: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value as String;
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
              "Full Legal Name",
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
              "Bank Account Number / IBAN",
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
              //controller: ownerEmailController,
              keyboardType: TextInputType.number,
              validator: (value) {
                bool emailValid = RegExp(
                        r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                    .hasMatch(value!);
                if (value.isEmpty) {
                  return "Enter Bank Account Number / IBAN";
                } else if (emailValid) {
                  return "Enter Bank Account Number / IBAN";
                }
                return null;
              },
              style: const TextStyle(color: AppColors.colorBlackHighEmp),
              decoration: InputDecoration(
                hintText: "Bank Account Number / IBAN",
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
              "Any other bank detail",
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
              //controller: ownerEmailController,
              keyboardType: TextInputType.number,
              validator: (value) {
                bool emailValid = RegExp(
                        r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789")
                    .hasMatch(value!);
                if (value.isEmpty) {
                  return "Enter Any other bank detail";
                } else if (emailValid) {
                  return "Enter Any other bank detail";
                }
                return null;
              },
              style: const TextStyle(color: AppColors.colorBlackHighEmp),
              decoration: InputDecoration(
                hintText: "Any other bank detail",
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
          SizedBox(height: 24.h),
        ],
      )),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: REdgeInsets.all(16),
        color: AppColors.colorWhiteHighEmp,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    padding: REdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/check.png",
                          height: 60,
                          width: 60,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Request Successful!',
                          style: TextStyle(
                            color: const Color(0xFF3BCE7F),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'You will receive funds within few days.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF474747),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const OwnerBottomNav()),
                                ModalRoute.withName('/'));
                          },
                          child: Container(
                            height: 48.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.colorPrimary,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Back to Home",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.colorWhiteHighEmp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 48.h,
            width: 195.w,
            decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                "Request Now",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.colorWhiteHighEmp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class RememberMeModel extends StatefulWidget {
  const RememberMeModel({super.key});

  @override
  State<RememberMeModel> createState() => _RememberMeModelState();
}

class _RememberMeModelState extends State<RememberMeModel> {
  bool? check1 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
          child: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: AppColors.colorBlackLowerEmp,
            ),
            child: Transform.scale(
              scale: 0.7,
              child: SizedBox(
                height: 20.h,
                width: 20.w,
                child: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    value: check1,
                    onChanged: (bool? value) {
                      setState(() {
                        check1 = value;
                      });
                    }),
              ),
            ),
          ),
        ),
        Text(
          "rememberMe".tr,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.colorBlackLowerEmp,
          ),
        ),
      ],
    );
  }
}

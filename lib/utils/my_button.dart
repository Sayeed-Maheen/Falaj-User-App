import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class MyButton extends StatefulWidget {
  final void Function()?
      onPressed; // Function to call when the button is pressed
  final String text; // Text to display on the button

  const MyButton({
    Key? key, // Optional key argument
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        height: 46.h,
        splashColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: widget.onPressed,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: AppColors.colorWhiteHighEmp,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

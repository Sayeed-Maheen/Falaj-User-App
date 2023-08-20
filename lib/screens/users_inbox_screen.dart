import 'package:falaj_user_app/screens/users_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class UsersInboxScreen extends StatelessWidget {
  UsersInboxScreen({Key? key}) : super(key: key);

  final List<String> _images = [
    'assets/images/inbox1.png',
    'assets/images/inbox2.png',
    'assets/images/inbox3.png',
    'assets/images/inbox4.png',
    'assets/images/inbox5.png',
  ];
  final List<String> _name = [
    'Jason Tom',
    'Andrew Parker',
    'Karen Castillo',
    'Maisy Humphrey',
    'Joshua Lawrence',
  ];
  final List<String> _message = [
    'You: What’s man!',
    'You: Ok, thanks!',
    'You: Ok, See you in To… ',
    'Have a good day, Maisy!',
    'The business plan loo…',
  ];
  final List<String> _time = [
    '· 9:40 AM',
    '· 9:25 AM',
    '· Fri',
    '· Fri',
    '· Thu',
  ];

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
            "Inbox",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.colorBlackHighEmp,
            ),
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            SizedBox(height: 8.h),
            ...List.generate(
              _images.length,
              (index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UsersChatScreen()));
                },
                child: Container(
                    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.colorWhiteHighEmp,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              _images[index],
                              height: 60,
                              width: 60,
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _name[index],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colorBlackHighEmp,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Text(
                                      _message[index],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.colorBlackLowEmp,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      _time[index],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.colorBlackLowEmp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.check_circle_outline,
                          color: AppColors.colorBlackLowEmp,
                          size: 18,
                        )
                      ],
                    )),
              ),
            ),
          ],
        )));
  }
}

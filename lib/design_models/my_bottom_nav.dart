import 'package:falaj_user_app/screens/inbox_screen.dart';
import 'package:falaj_user_app/screens/owner/owner_home_screen.dart';
import 'package:falaj_user_app/screens/owner/request_sell_history_screen.dart';
import 'package:falaj_user_app/screens/profile_screen.dart';
import 'package:falaj_user_app/screens/user/rented_falaj_screen.dart';
import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../screens/user/users_home_screen.dart';

enum UserRole {
  user,
  owner,
}

class MyBottomNav extends StatefulWidget {
  final UserRole userRole;
  const MyBottomNav({Key? key, required this.userRole}) : super(key: key);

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;
  late final List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      if (widget.userRole == UserRole.owner)
        OwnerHomeScreen()
      else
        UsersHomeScreen(),
      if (widget.userRole == UserRole.owner)
        const RequestSellHistoryScreen()
      else
        const RentedFalajScreen(),
      InboxScreen(),
      ProfileScreen(userRole: widget.userRole),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
          color: AppColors.colorWhiteHighEmp,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.colorPrimary,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  widget.userRole == UserRole.owner
                      ? "assets/images/my_falaj.svg"
                      : "assets/images/home.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 0 ? AppColors.colorPrimary : Colors.grey,
                ),
                label:
                    widget.userRole == UserRole.owner ? "My Falaj" : "home".tr,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  widget.userRole == UserRole.owner
                      ? "assets/images/req.svg"
                      : "assets/images/heart.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 1 ? AppColors.colorPrimary : Colors.grey,
                ),
                label:
                    widget.userRole == UserRole.owner ? "Request" : "rented".tr,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/chat.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 2 ? AppColors.colorPrimary : Colors.grey,
                ),
                label: "inbox".tr,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/profile.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 3 ? AppColors.colorPrimary : Colors.grey,
                ),
                label: "profile".tr,
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

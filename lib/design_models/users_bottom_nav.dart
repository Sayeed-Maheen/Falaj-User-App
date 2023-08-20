import 'package:falaj_user_app/screens/users_profile_screen.dart';
import 'package:falaj_user_app/screens/rented_falaj_screen.dart';
import 'package:falaj_user_app/screens/users_inbox_screen.dart';
import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/users_home_screen.dart';

class UsersBottomNav extends StatefulWidget {
  const UsersBottomNav({Key? key}) : super(key: key);

  @override
  State<UsersBottomNav> createState() => _UsersBottomNavState();
}

class _UsersBottomNavState extends State<UsersBottomNav> {
  int _currentIndex = 0;

  final tabs = [
    UsersHomeScreen(),
    const RentedFalajScreen(),
    UsersInboxScreen(),
    const UsersProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
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
                  "assets/images/home.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 0 ? AppColors.colorPrimary : Colors.grey,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/heart.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 1 ? AppColors.colorPrimary : Colors.grey,
                ),
                label: "Rented",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/chat.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 2 ? AppColors.colorPrimary : Colors.grey,
                ),
                label: "Inbox",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/profile.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 3 ? AppColors.colorPrimary : Colors.grey,
                ),
                label: "Profile",
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

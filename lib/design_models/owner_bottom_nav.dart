import 'package:falaj_user_app/screens/owner/owner_home_screen.dart';
import 'package:falaj_user_app/screens/owner/owner_inbox_screen.dart';
import 'package:falaj_user_app/screens/user/users_profile_screen.dart';
import 'package:falaj_user_app/screens/user/rented_falaj_screen.dart';
import 'package:falaj_user_app/screens/user/users_inbox_screen.dart';
import 'package:falaj_user_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/owner/owner_profile_screen.dart';
import '../screens/user/users_home_screen.dart';

class OwnerBottomNav extends StatefulWidget {
  const OwnerBottomNav({Key? key}) : super(key: key);

  @override
  State<OwnerBottomNav> createState() => _OwnerBottomNavState();
}

class _OwnerBottomNavState extends State<OwnerBottomNav> {
  int _currentIndex = 0;

  final tabs = [
    OwnerHomeScreen(),
    const RentedFalajScreen(),
    OwnerInboxScreen(),
    const OwnerProfileScreen()
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
                  "assets/images/my_falaj.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 0 ? AppColors.colorPrimary : Colors.grey,
                ),
                label: "My Falaj",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/req.svg",
                  height: 24.h,
                  width: 24.w,
                  color:
                      _currentIndex == 1 ? AppColors.colorPrimary : Colors.grey,
                ),
                label: "Request",
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

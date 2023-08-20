import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

class OwnerChatScreen extends StatefulWidget {
  const OwnerChatScreen({Key? key}) : super(key: key);

  @override
  State<OwnerChatScreen> createState() => _OwnerChatScreenState();
}

class _OwnerChatScreenState extends State<OwnerChatScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    // Add observer to listen for keyboard events
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    // Remove observer when disposing the widget
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // Check keyboard visibility when the window metrics change
    final keyboardVisible =
        WidgetsBinding.instance?.window.viewInsets.bottom != 0;

    setState(() {
      isKeyboardVisible = keyboardVisible;
    });
  }

  Widget _buildChatScreen() {
    return Column(
      children: [
        Expanded(
          child: _buildList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              _buildInput(),
            ],
          ),
        ),
      ],
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: Container(
        margin: REdgeInsets.only(left: 16, right: 16),
        padding: REdgeInsets.only(right: 8, top: 8, bottom: 8, left: 16),
        decoration: BoxDecoration(
          color: AppColors.colorGrey2,
          borderRadius: BorderRadius.circular(50),
        ),
        width: 300.w,
        child: TextFormField(
          cursorColor: AppColors.colorPrimary,
          style: const TextStyle(color: AppColors.colorBlackHighEmp),
          decoration: InputDecoration(
            hintText: 'Type Message...',
            hintStyle: const TextStyle(color: AppColors.colorBlueLight),
            suffixIcon: SvgPicture.asset(
              'assets/images/send.svg',
              fit: BoxFit.fill,
              height: 16,
              width: 16,
            ),
            //contentPadding: const EdgeInsets.fromLTRB(16, 16,-16, 16),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView(children: const [
      // ChatModel()
    ]);
  }

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
        title: Row(
          children: [
            Image.asset(
              "assets/images/chat_img.png",
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 12.w),
            Text(
              "John Smith",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: AppColors.colorBlackHighEmp,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: EdgeInsets.only(bottom: isKeyboardVisible ? 0 : 0),
            child: _buildChatScreen(),
          ),
        ),
      ),
    );
  }
}

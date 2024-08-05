import 'package:flutter/material.dart';
import 'package:request_builder/request_builder.dart';
import 'package:request_builder/src/assets.dart';
import 'package:request_builder/src/extensions.dart';

class AppDialogs {
  static showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
    StatePosition statePosition = StatePosition.up,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: error ? AppColors.errorColor : AppColors.mainColor,
        dismissDirection: DismissDirection.up,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        shape: const StadiumBorder(),
        margin: EdgeInsets.only(
            bottom: statePosition == StatePosition.up ? 90.h : 10.h,
            left: 5.w,
            right: 5.w),
        content: Text(message),
      ),
    );
  }
}

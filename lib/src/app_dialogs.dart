import 'package:flutter/material.dart';
import 'package:request_builder/request_builder.dart';
import 'package:request_builder/src/assets.dart';
import 'package:request_builder/src/extensions.dart';

class AppDialogs {
  static showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
    double bottom = 20.0,
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
            bottom:bottom ,
            left: 5.w,
            right: 5.w),
        content: Text(message),
      ),
    );
  }
}

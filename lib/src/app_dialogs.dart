import 'package:flutter/material.dart';
import 'package:request_builder/request_builder.dart';
import 'package:request_builder/src/assets.dart';
import 'package:request_builder/src/extensions.dart';

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

showToast( {required BuildContext? context,   required String message,bool isError = false,required StatePosition statePosition,}) async {
  if (context == null) {
    return;
  }
  showSimpleNotification(
    Text(
      message,
      textAlign: TextAlign.center,
      style: RequestBuilderInitializer
          .instance.messageTextStyle,
    ),
    duration:  const Duration(milliseconds: 500),
    background: isError ? AppColors.errorColor : AppColors.mainColor,
    position: statePosition == StatePosition.up ? NotificationPosition.top : NotificationPosition.bottom,
  );
}



// class AppDialogs {
//   static showSnackBar({
//     required BuildContext context,
//     required String message,
//     required StatePosition statePosition,
//     bool error = false,
//     double bottom = 20.0,
//    }) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: error ? AppColors.errorColor : AppColors.mainColor,
//         dismissDirection: statePosition == StatePosition.up ? DismissDirection.up : DismissDirection.down,
//         showCloseIcon: true,
//         closeIconColor: Colors.white,
//         shape: const StadiumBorder(),
//         margin: EdgeInsets.only(
//             bottom: statePosition == StatePosition.up ? bottom.h : 5.h,
//             left: 5.w,
//             right: 5.w),
//         content: Text(message),
//       ),
//     );
//   }
// }

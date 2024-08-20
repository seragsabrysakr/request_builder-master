import 'package:auto_size_text/auto_size_text.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:request_builder/request_builder.dart';
import 'package:request_builder/src/extensions.dart';

class FToast {
  static Future<Object?> showCustomToast({
    required BuildContext context,
    required String title,
    required String message,
    required Color color,
    required StatePosition statePosition,
  }) {
    return showFlash(
      barrierDismissible: true,
      context: context,
      persistent: true,
      transitionDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 4),
      builder: (context, controller) {
        return Flash(
          position: statePosition == StatePosition.up
              ? FlashPosition.top
              : FlashPosition.bottom,
          dismissDirections: const [
            FlashDismissDirection.startToEnd,
            FlashDismissDirection.endToStart
          ],
          forwardAnimationCurve: Curves.easeInCirc,
          controller: controller,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: statePosition == StatePosition.up ? 80.h : 6.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    margin: EdgeInsets.only(
                      bottom: 2.sp,
                      left: 1.sp,
                      right: 1.sp,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          color: color,
                        )
                      ],
                    ),
                    child: Container(
                      width: context.width * 0.9,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.sp,
                        vertical: 5.sp,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0.5.sp,
                            blurRadius: 0.5.sp,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  title,
                                  style: RequestBuilderInitializer
                                      .instance.titleTextStyle
                                      ?.copyWith(color: color),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    controller.dismiss();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1.w, vertical: 1.h),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.grey.shade300,
                                      size: 4.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey.shade100,
                              thickness: 1.sp,
                            ),
                            SizedBox(
                              height: 6.h,
                              width: 90.w,
                              child: AutoSizeText(
                                softWrap: true,
                                message,
                                style: RequestBuilderInitializer
                                    .instance.messageTextStyle,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            )
                          ],
                        ),
                      )
                      // .addPadding(bottom: 21.0, top: 12.0)
                      ,
                    ),
                  ),
                )
                // .addPadding(bottom: context.height * 0.07)
                ,
              ],
            ),
          ),
        );
      },
    );
  }
}

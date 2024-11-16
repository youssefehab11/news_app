import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/fonts_manager.dart';

class AppLightStyles {
  static TextStyle exoF22W400 = TextStyle(
    fontFamily: FontsManager.exo,
    fontSize: 22.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
  static TextStyle exoF16W400 = TextStyle(
    fontFamily: FontsManager.exo,
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle poppinsF24W700 = TextStyle(
    fontFamily: FontsManager.poppins,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle poppinsF22W700 = TextStyle(
    fontFamily: FontsManager.poppins,
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle poppinsF14W400 = TextStyle(
    fontFamily: FontsManager.poppins,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle poppinsF16W600 = TextStyle(
    fontFamily: FontsManager.poppins,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}

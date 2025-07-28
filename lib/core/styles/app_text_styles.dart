import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_ganeral/core/styles/app_colors.dart';


class TextStyles {
  static TextStyle textTitle32Home = GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF231F20),
  );
  static TextStyle homeText14Style = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle homeText18Black = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xff231F20),
  );
  static TextStyle homeText12Grey = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xff6D6265),
  );
  static TextStyle articleDescripton16Black = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xff231F20),
  );
  
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/styles/app_colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.maxLines,
    this.width, this.isPassword, this.controller, this.validator, this.keyboardInputType,
  });
  final String? hintText;
  final double? width;
  final Widget? suffixIcon;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardInputType;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextFormField(
        maxLines: maxLines ?? 1,
        keyboardType: keyboardInputType ?? TextInputType.text,
        controller: controller,
        validator: validator,
        obscureText: isPassword ?? false,
        autofocus: false,
        cursorColor: AppColors.black,
        decoration: InputDecoration(
          hint: Text(hintText ?? ''),
          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: Color(0xFF8391A1),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xFFF7F8F9), width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.black, width: 1.w),
          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          filled: true,
          fillColor:Colors.white,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

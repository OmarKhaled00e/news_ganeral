import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE9EEFA), width: 1),
            borderRadius: BorderRadius.circular(65.r),
            color: Colors.transparent,
          ),
          child: Text(title,style: TextStyles.homeText14Style,),
        ),
      ),
    );
  }
}

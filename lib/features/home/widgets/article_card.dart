import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.title,
    required this.authorName,
    required this.date,
    this.imageUrl,
  });
  final String title;
  final String authorName;
  final String date;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 238.w,
                child: Text(title, style: TextStyles.homeText18Black)),
              SizedBox(height: 8.h),
              Text('$authorName . $date', style: TextStyles.homeText12Grey),
            ],
          ),
            SizedBox(
            width: 112.w,
            height: 80.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: imageUrl ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQML9OdsC38Ii_3yXkAUV_I6laUNm6th5DtMg&s',
                height: 206.h,
                fit: BoxFit.fill,
                  
              ),
            ),
          ),
        ],
      ),
    );
  }
}

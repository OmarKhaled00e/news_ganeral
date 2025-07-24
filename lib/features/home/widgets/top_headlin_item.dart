import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';

class TopHeadlinItem extends StatelessWidget {
  const TopHeadlinItem({super.key, required this.title, required this.authorName, required this.date, this.imageUrl});
  final String title;
  final String authorName;
  final String date;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQML9OdsC38Ii_3yXkAUV_I6laUNm6th5DtMg&s',
              height: 206.h,
              fit: BoxFit.fill,
                
            ),
          ),
        ),
        SizedBox(height: 16.h,),
        Text(title , style: TextStyles.homeText18Black,),
        SizedBox(height: 8.h,),
        Text('$authorName . $date', style: TextStyles.homeText12Grey,),
      ],
    );
  }
}

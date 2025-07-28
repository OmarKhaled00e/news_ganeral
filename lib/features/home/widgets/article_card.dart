import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';
import 'package:news_ganeral/features/home/article_details_view.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ArticleDetailsView.routeName,
          arguments: article,
        );
      },
      child: Padding(
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
                  child: Text(
                    article.title ?? '',
                    maxLines: 2,
                    style: TextStyles.homeText18Black,
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 238.w,
                  child: Text(
                    '${article.author} . ${article.publishedAt}',
                    style: TextStyles.homeText12Grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 112.w,
              height: 80.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl:
                      article.urlToImage ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQML9OdsC38Ii_3yXkAUV_I6laUNm6th5DtMg&s',
                  height: 206.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

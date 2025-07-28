import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({super.key, required this.article});
  static const routeName = 'ArticleDetailsView';
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .8,
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 316.h,
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQML9OdsC38Ii_3yXkAUV_I6laUNm6th5DtMg&s',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 300.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? '',
                        style: TextStyles.homeText18Black,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '${article.author} . ${DateFormat('yyyy-MM-dd - kk:mm').format(article.publishedAt!)}',
                        style: TextStyles.homeText12Grey,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          article.description.toString(),
                          style: TextStyles.articleDescripton16Black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

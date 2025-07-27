import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';
import 'package:news_ganeral/features/home/widgets/article_card.dart';
import 'package:news_ganeral/features/search_result/services/search_result_services.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key, required this.query});
  static const routeName = 'SearchResultView';
  final String query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Search_ result'.tr(), style: TextStyles.homeText18Black),
      ),
      body: FutureBuilder(
        future: SearchResultServices().searchItemByName(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            ArticlesModel topHeadlinesModel = snapshot.data! as ArticlesModel;
            if (topHeadlinesModel.totalResults == 0) {
              return Center(child: Text('no_results'.tr()));
            }
            return Column(
              children: [
                SizedBox(height: 16.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: topHeadlinesModel.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadlinesModel.articles![index];
                        return ArticleCard(
                          imageUrl: article.urlToImage,
                          title: article.title ?? " ",
                          authorName: article.author ?? ' ',
                          date: DateFormat(
                            'yyyy-MM-dd - kk:mm',
                          ).format(article.publishedAt!),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('someThing went wronge'));
        },
      ),

    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/constants/constants.dart';
import 'package:news_ganeral/core/network/api_endpoints.dart';
import 'package:news_ganeral/core/network/dio_helper.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';
import 'package:news_ganeral/features/home/services/home_screen_serviecs.dart';
import 'package:news_ganeral/features/home/widgets/article_card.dart';
import 'package:news_ganeral/features/home/widgets/custom_category_item.dart';
import 'package:news_ganeral/features/home/widgets/top_headlin_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    HomeScreenServiecs().getTopHeadLineArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Color(0xFF231F20)),
          ),
        ],
        backgroundColor: Color(0xFFE9EEFA),
        toolbarHeight: 120.h,
        title: Text('explore'.tr(), style: TextStyles.textTitle32Home),
      ),
      body: FutureBuilder(
        future: HomeScreenServiecs().getTopHeadLineArticle(),
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
            TopHeadlinesModel topHeadlinesModel =
                snapshot.data! as TopHeadlinesModel;
            if (topHeadlinesModel.totalResults == 0) {
              return Center(child: Text('no_results'.tr()));
            }
            return Column(
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.w),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        CustomCategoryItem(title: 'travel'.tr()),
                        CustomCategoryItem(title: 'technology'.tr()),
                        CustomCategoryItem(title: 'business'.tr()),
                        CustomCategoryItem(title: 'entertainment'.tr()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      TopHeadlinItem(
                        imageUrl: topHeadlinesModel.articles![0].urlToImage,
                        title: topHeadlinesModel.articles![0].title ?? " ",
                        authorName:
                            topHeadlinesModel.articles![0].author ?? " ",
                        date: DateFormat(
                          'yyyy-MM-dd - kk:mm',
                        ).format(topHeadlinesModel.articles![0].publishedAt!),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
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
                          date: DateFormat('yyyy-MM-dd - kk:mm').format(article.publishedAt!),
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

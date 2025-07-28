import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/constants/constants.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';
import 'package:news_ganeral/features/home/services/home_screen_serviecs.dart';
import 'package:news_ganeral/features/home/widgets/article_card.dart';
import 'package:news_ganeral/features/home/widgets/custom_category_item.dart';
import 'package:news_ganeral/features/home/widgets/search_text_field.dart';
import 'package:news_ganeral/features/home/widgets/top_headlin_item.dart';
import 'package:news_ganeral/features/search_result/search_result_view.dart';

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
          SearchTextField(),
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(Locale('ar'));
              } else {
                context.setLocale(Locale('en'));
              }
              AppConstants.lang = context.locale.languageCode;
            },
            icon: Icon(Icons.language, color: Colors.black),
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
            ArticlesModel topHeadlinesModel = snapshot.data! as ArticlesModel;
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
                        CustomCategoryItem(
                          title: 'travel'.tr(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SearchResultView.routeName,
                              arguments: 'travel'.tr(),
                            );
                          },
                        ),
                        CustomCategoryItem(
                          title: 'technology'.tr(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SearchResultView.routeName,
                              arguments: 'technology'.tr(),
                            );
                          },
                        ),
                        CustomCategoryItem(
                          title: 'business'.tr(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SearchResultView.routeName,
                              arguments: 'business'.tr(),
                            );
                          },
                        ),
                        CustomCategoryItem(
                          title: 'entertainment'.tr(),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SearchResultView.routeName,
                              arguments: 'entertainment'.tr(),
                            );
                          },
                        ),
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
                        return ArticleCard(article: article);
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

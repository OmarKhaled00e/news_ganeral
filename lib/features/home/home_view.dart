import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/constants/constants.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';
import 'package:news_ganeral/features/home/cubit/cubit/home_cubit.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';
import 'package:news_ganeral/features/home/repo/home_repo.dart';
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
    super.initState();
    HomeRepo().getTopHeadLineArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9EEFA),
        toolbarHeight: 120.h,
        title: Text('explore'.tr(), style: TextStyles.textTitle32Home),
        actions: [
          const SearchTextField(),
          IconButton(
            icon: const Icon(Icons.language, color: Colors.black),
            onPressed: () {
              final isEnglish = context.locale.languageCode == 'en';
              context.setLocale(Locale(isEnglish ? 'ar' : 'en'));
              AppConstants.lang = context.locale.languageCode;
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeErorr) {
            return Center(child: Text(state.error));
          } else if (state is HomeSuccess) {
            final ArticlesModel topHeadLineModel = state.topHeadLines;
            final articles = topHeadLineModel.articles ?? [];

            if (articles.isEmpty) {
              return const Center(child: Text('No articles found'));
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
                      physics: const BouncingScrollPhysics(),
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
                  child: TopHeadlinItem(
                    imageUrl: articles[0].urlToImage,
                    title: articles[0].title ?? '',
                    authorName: articles[0].author ?? '',
                    date: DateFormat('yyyy-MM-dd - kk:mm')
                        .format(articles[0].publishedAt!),
                  ),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return ArticleCard(article: articles[index]);
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}

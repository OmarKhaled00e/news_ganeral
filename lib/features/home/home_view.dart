import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_ganeral/core/styles/app_text_styles.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Color(0xFF231F20),)),
        ],
        backgroundColor: Color(0xFFE9EEFA),
        toolbarHeight: 120.h,
        title: Text('explore'.tr() , style: TextStyles.textTitle32Home,),
      ),
      body: Column(children: [
        SizedBox(height: 16.h,),
        Padding(padding: EdgeInsetsDirectional.only(start: 32.w),
        child: SizedBox(
          height: 40.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              CustomCategoryItem(
                title: 'travel'.tr(),
              ),
              CustomCategoryItem(
                title: 'technology'.tr(),
              ),
              CustomCategoryItem(
                title: 'business'.tr(),
              ),
              CustomCategoryItem(
                title: 'entertainment'.tr(),
              ),
            ],
          ),
        ),),
        SizedBox(
          height: 24.h,
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            TopHeadlinItem(title: '', authorName: '', date: '',)
          ],
        ),
        ),
        SizedBox(height: 24.h,),
        Expanded(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: ListView(children: [
            ArticleCard(title: 'News title ', authorName: 'omar', date: '25 jen 2025',),
          ],),
        ))
      ],)
    );
  }
}

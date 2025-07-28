import 'package:flutter/material.dart';
import 'package:news_ganeral/features/home/article_details_view.dart';
import 'package:news_ganeral/features/home/home_view.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';
import 'package:news_ganeral/features/search_result/search_result_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case ArticleDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          Article article = settings.arguments as Article;
          return ArticleDetailsView(article: article);
        },
      );
    case SearchResultView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final query = settings.arguments as String;
          return SearchResultView(query: query);
        },
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
        settings: settings,
      );
  }
}

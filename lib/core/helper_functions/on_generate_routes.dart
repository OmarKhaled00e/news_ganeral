import 'package:flutter/material.dart';
import 'package:news_ganeral/features/home/home_view.dart';
import 'package:news_ganeral/features/search_result/search_result_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
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

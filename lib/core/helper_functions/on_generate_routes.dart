

import 'package:flutter/material.dart';
import 'package:news_ganeral/features/home/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch (settings.name) {
    

  
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
        settings: settings,
      );
  }
}
import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}

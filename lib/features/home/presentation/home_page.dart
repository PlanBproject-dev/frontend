import 'package:flutter/material.dart';
import 'package:plan_b/shared/widgets/app_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      body: Center(child: Text('Hello, planB!')),
    );
  }
}
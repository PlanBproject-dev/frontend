import 'package:flutter/material.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/cta.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      body: const Center(child: Text('Hello, planB!')),
      bottomCta: Cta(
        text: '다음',
        variant: CtaVariant.secondary,
        isActive: false,
        onPressed: () {}
      ),
    );
  }
}
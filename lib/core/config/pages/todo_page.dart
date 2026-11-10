// todo_page.dart
// - 화면 구현 전 임시 페이지: 라우트에 연결할 실제 페이지 위젯이 생기면 교체

import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage(this.title, {super.key});

  final String title; // 어떤 화면 자리인지 표시

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title)));
  }
}
import 'package:flutter/material.dart';
import 'package:lesson_flutter/lesson/lesson_6.dart/bottom_tabs/router_pages/detail_page.dart';

class RoutersView extends StatelessWidget {
  const RoutersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          const Text('遷移できる画面一覧', style: TextStyle(fontSize: 24)),

          /// detailPageに画面遷移する。
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailPage()),
              );
            },
            child: Text(AppRoutes.detailPage.name),
          ),

          ...AppRoutes.values.map((route) {
            return ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed(context, route.path);
              },
              child: Text(route.name),
            );
          }),
        ],
      ),
    );
  }
}

enum AppRoutes {
  detailPage,
  officialPage;

  String get path {
    switch (this) {
      case detailPage:
        return '/detail';
      case officialPage:
        return '//official';
    }
  }
}

import 'package:flutter/material.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    /// ① タブバーを使用する時は、DefaultTabControllerを使用。
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        /// ② ScaffoldのappBar（bottom）にTabBarを設定。
        appBar: AppBar(
          bottom: const TabBar(tabs: [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')]),
        ),

        /// ③ TabBarViewを使用して、タブごとの内容を表示。
        body: const TabBarView(
          children: [
            Center(child: Text('Content for Tab 1')),
            Center(child: Text('Content for Tab 2')),
          ],
        ),
      ),
    );
  }
}

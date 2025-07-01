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
        body: TabBarView(
          children: [
            Center(
              child: Image.network(
                'https://yt3.googleusercontent.com/EpsyQXQJscAYox5DJW90MqSYznQwvMMeYCuIpv8Bjp4I7L6RTx8fn36Z2icCMy0EfTljUPxhINo=s900-c-k-c0x00ffffff-no-rj',
              ),
            ),
            Center(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwdEEO-mCKk-1ZV-y9xarZawuakiH4VY381g&s',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

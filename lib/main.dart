import 'package:flutter/material.dart';
import 'package:lesson_flutter/lesson/lesson_6.dart/bottom_tabs/router_pages/detail_page.dart';
import 'package:lesson_flutter/lesson/lesson_6.dart/bottom_tabs/router_pages/official_page.dart';
import 'package:lesson_flutter/lesson/lesson_6.dart/bottom_tabs/routers_view.dart';
// import 'package:lesson_flutter/lesson/lesson_3.dart';
import 'package:lesson_flutter/lesson/lesson_6.dart/lesson_6.dart';

/// アプリ起動はここから行われる。
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ///
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),

      /// アプリの初期画面を設定する.
      /// 下のroutesに設定している画面から設定する。
      initialRoute: "/",

      /// ここに、遷移できる画面を設定する.
      routes: {
        "/": (context) => const Lesson6Widget(),
        AppRoutes.detailPage.path: (context) => const DetailPage(),
        AppRoutes.officialPage.path: (context) => const OfficialPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /// 画面はここから作る.
    ///
    /// 1つの画面（画面いっぱいに表示）したい場合、Scaffoldを使う.
    return Scaffold(
      /// 画面の上部に表示されるバー.
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("タイトル"),
      ),
      body: Center(child: Text('Hello World')),
    );
  }
}

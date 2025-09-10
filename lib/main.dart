// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lesson_flutter/firebase_options.dart';
import 'package:lesson_flutter/l10n/app_localizations.dart';
import 'package:lesson_flutter/lesson/lesson_13/lesson_13_widget.dart';
// import 'package:lesson_flutter/lesson/lesson_10/lesson10_auth_gate.dart';
import 'package:lesson_flutter/lesson/lesson_13/localization_demo_page.dart';
import 'package:lesson_flutter/lesson/lesson_13/method_channels_page.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/router_pages/detail_page.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/router_pages/official_page.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/routers_view.dart';
// import 'package:lesson_flutter/lesson/lesson_3.dart';
// import 'package:lesson_flutter/lesson/lesson_6/lesson_6.dart';
// import 'package:lesson_flutter/lesson/lesson_7/lesson_7.dart';
// import 'package:lesson_flutter/lesson/lesson_8/lesson_8.dart';
// import 'package:lesson_flutter/lesson/lesson_9/lesson9_auth_gate.dart';

/// アプリ起動はここから行われる。
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase系を動かす場合は、初期セットアップしたのちにこちらを読み込ませる必要あり。
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        "/": (context) => const Lesson13Widget(), // 初期表示できる画面はこちらから設定する
        AppRoutes.detailPage.path: (context) => const DetailPage(),
        AppRoutes.officialPage.path: (context) => const OfficialPage(),
      },

      /// 対応している言語を追加する。
      supportedLocales: [
        Locale('en'), // English
        Locale('ja'), // Japanese
      ],

      /// ローカライズのデリゲートを追加する。
      /// これを追加しないと、多言語化が動作しない。
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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

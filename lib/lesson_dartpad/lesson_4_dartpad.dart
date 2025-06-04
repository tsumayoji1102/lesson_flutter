import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Lesson4Widget(),
    );
  }
}

class Lesson4Widget extends StatefulWidget {
  const Lesson4Widget({super.key});

  /// ウィジェットが作られるときに最初に1回だけ呼ばれる.
  ///
  /// Lesson4Widgetは、_Lesson4WidgetStateを状態として持つ、という意味。
  @override
  State<Lesson4Widget> createState() => _Lesson4WidgetState();
}

class _Lesson4WidgetState extends State<Lesson4Widget> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("タイトル"), backgroundColor: Colors.lightGreen),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count', style: TextStyle(fontSize: 20)),
            ElevatedButton(
              /// ボタンをタップすると、_incrementが呼ばれる。
              onPressed: _increment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text('+1', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  /// 数字を1増やす。そして、画面を再レンダリングする。
  void _increment() {
    _count++;
    setState(() {});
  }
}

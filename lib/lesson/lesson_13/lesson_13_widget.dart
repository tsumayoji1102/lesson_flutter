import 'package:flutter/material.dart';
import 'package:lesson_flutter/lesson/lesson_13/localization_demo_page.dart';
import 'package:lesson_flutter/lesson/lesson_13/method_channels_page.dart';

class Lesson13Widget extends StatelessWidget {
  const Lesson13Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lesson 13"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(children: [MethodChannelsPage(), LocalizationDemoPage()]),
    );
  }
}

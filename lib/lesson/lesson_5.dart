import 'package:flutter/material.dart';

class Lesson5Widget extends StatelessWidget {
  const Lesson5Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 5'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello, World!'),
            ElevatedButton(
              onPressed: () {
                // ボタンが押されたときの処理
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Button Pressed')));
              },
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}

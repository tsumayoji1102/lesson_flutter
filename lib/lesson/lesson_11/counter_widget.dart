import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('$_counter', key: Key('counter_text')),
          ElevatedButton(
            key: Key('increment_button'),
            onPressed: () => setState(() => _counter++),
            child: Text('+1'),
          ),
          ElevatedButton(
            key: Key('reset_button'),
            onPressed: () => setState(() => _counter = 0),
            child: Text('リセット'),
          ),
        ],
      ),
    );
  }
}

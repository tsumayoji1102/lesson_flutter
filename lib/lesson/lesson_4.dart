import 'package:flutter/material.dart';

class Lesson4Widget extends StatefulWidget {
  const Lesson4Widget({super.key});

  /// ウィジェットが作られるときに最初に1回だけ呼ばれる.
  ///
  /// Lesson4Widgetは、_Lesson4WidgetStateを状態として持つ、という意味。
  @override
  State<Lesson4Widget> createState() => _Lesson4WidgetState();
}

enum ColorTypes { red, blue, yellow }

extension on ColorTypes {
  Color get value => switch (this) {
    ColorTypes.red => Colors.red,
    ColorTypes.blue => Colors.blue,
    ColorTypes.yellow => Colors.yellow,
  };
}

class _Lesson4WidgetState extends State<Lesson4Widget> {
  int _count = 0;
  ColorTypes _colorType = ColorTypes.red;
  List<String> _names = [];
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("タイトル"), backgroundColor: Colors.lightGreen),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('$_count', style: TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  ElevatedButton(
                    /// ボタンをタップすると、_incrementが呼ばれる。
                    onPressed: _increment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                    child: const Text(
                      '+1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _decrement,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      '-1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _reset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Hello World',
                style: TextStyle(fontSize: 20, color: _colorType.value),
              ),
              ElevatedButton(
                onPressed: _changeColor,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: Text(
                  'Change Color',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your name',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _names.add(_nameController.text);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return Text(_names[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 数字を1増やす。そして、画面を再レンダリングする。
  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  void _changeColor() {
    setState(() {
      if (_colorType == ColorTypes.values.last) {
        _colorType = ColorTypes.values.first;
      } else {
        _colorType = ColorTypes.values[_colorType.index + 1];
      }
    });
  }
}

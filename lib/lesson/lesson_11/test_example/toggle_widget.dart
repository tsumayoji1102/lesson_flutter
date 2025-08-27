import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool _isOn = false;
  String _message = 'オフです';

  void _toggle() {
    setState(() {
      _isOn = !_isOn;
      _message = _isOn ? 'オンです' : 'オフです';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(_message, key: Key('status_text')),
          Switch(
            key: Key('toggle_switch'),
            value: _isOn,
            onChanged: (_) => _toggle(),
          ),
          ElevatedButton(
            key: Key('toggle_button'),
            onPressed: _toggle,
            child: Text('切替'),
          ),
        ],
      ),
    );
  }
}

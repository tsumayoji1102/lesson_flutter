// ignore: file_names
import 'package:flutter/material.dart';

/// 解答例1
class ButtonDemoScreen extends StatelessWidget {
  const ButtonDemoScreen({super.key});

  // 共通のSnackBar表示
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // 共通のボタンWidget
  Widget _buildActionButton({
    required String text,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ボタンデモ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
              text: '保存',
              backgroundColor: Colors.blue,
              onPressed: () => _showMessage(context, '保存しました'),
            ),
            SizedBox(height: 20),
            _buildActionButton(
              text: '削除',
              backgroundColor: Colors.red,
              onPressed: () => _showMessage(context, '削除しました'),
            ),
            SizedBox(height: 20),
            _buildActionButton(
              text: '編集',
              backgroundColor: Colors.green,
              onPressed: () => _showMessage(context, '編集しました'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 解答例2
/// enumを使用する例
enum ButtonActions {
  save,
  delete,
  edit;

  String get name {
    switch (this) {
      case ButtonActions.save:
        return '保存';
      case ButtonActions.delete:
        return '削除';
      case ButtonActions.edit:
        return '編集';
    }
  }

  Color get color {
    switch (this) {
      case ButtonActions.save:
        return Colors.blue;
      case ButtonActions.delete:
        return Colors.red;
      case ButtonActions.edit:
        return Colors.green;
    }
  }
}

class ButtonDemoScreen2 extends StatelessWidget {
  const ButtonDemoScreen2({super.key});

  // 共通のSnackBar表示
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // 共通のボタンWidget
  Widget _buildActionButton(
    BuildContext context, {
    required ButtonActions action,
  }) {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () => _showMessage(context, '${action.name}しました'),
        style: ElevatedButton.styleFrom(
          backgroundColor: action.color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(action.name, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ボタンデモ')),
      body: Center(
        /// Columnのchildrenをenumで生成
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children:
              ButtonActions.values.map((action) {
                return _buildActionButton(context, action: action);
              }).toList(),
        ),
      ),
    );
  }
}

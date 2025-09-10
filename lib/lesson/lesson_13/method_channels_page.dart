import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelsPage extends StatelessWidget {
  const MethodChannelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('システム音が鳴ります')),
          SizedBox(height: 20),
          ElevatedButton(
            /// ボタンをタップしたら、音を再生する
            onPressed: () async {
              await _playSound();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.music_note), Text('再生')],
            ),
          ),
        ],
      ),
    );
  }

  /// MethodChannelのインスタンスを作成
  static const platform = MethodChannel('demo/sound');

  /// ネイティブのコードを呼び出すメソッド
  /// playSoundという名前のネイティブ側のコードを呼び出す
  Future<void> _playSound() async {
    try {
      /// invokeMethodで、ネイティブ側のメソッドを呼び出せる
      /// （返却値がある場合は、戻り値を受け取ることも可能）
      await platform.invokeMethod('playSound');
    } catch (e) {
      print('Sound failed: $e');
    }
  }
}

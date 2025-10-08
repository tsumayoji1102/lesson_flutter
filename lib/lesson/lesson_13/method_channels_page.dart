import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MethodChannelsPage extends HookWidget {
  const MethodChannelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nativeText = useState<String>("");
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
          Center(child: Text(nativeText.value)),
          SizedBox(height: 20),
          ElevatedButton(
            /// ボタンをタップしたら、文字列を取得して反映する
            onPressed: () async {
              nativeText.value = await getTextFromNative();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.music_note), Text('文字列を取得')],
            ),
          ),
          ElevatedButton(
            /// ボタンをタップしたら、文字列を取得して反映する
            onPressed: () async {
              await vibrate();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.music_note), Text('バイブレーション')],
            ),
          ),
        ],
      ),
    );
  }

  /// MethodChannelのインスタンスを作成
  static const platform = MethodChannel('example');

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

  Future<String> getTextFromNative() async {
    try {
      final String result = await platform.invokeMethod('getText');
      print('Received from native: $result');
      return result;
    } catch (e) {
      print('Failed to get text from native: $e');
      return 'エラーが発生しました';
    }
  }

  Future<void> vibrate() async {
    try {
      final result = await platform.invokeMethod('vibrate');
      print(result);
    } catch (e) {
      print('Vibration failed: $e');
    }
  }
}

import 'package:flutter/material.dart';

class OfficialPage extends StatelessWidget {
  const OfficialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('公式ページ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // タイトル
            Text(
              '公式お知らせ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // 更新日
            Text(
              '最終更新: 2024年6月24日',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(height: 20),

            // 内容
            Text(
              'こちらは公式ページです。\n\n'
              '重要なお知らせやアップデート情報をお伝えします。\n\n'
              '画面遷移のテスト用として作成されたサンプルページです。',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            Spacer(),

            // 戻るボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('戻る'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

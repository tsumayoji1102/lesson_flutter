import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('詳細画面')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // タイトル
            Text(
              'サンプル記事タイトル',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // 日付
            Text(
              '2024年6月24日',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            SizedBox(height: 20),

            // 内容
            Text(
              'ここに詳細な内容が表示されます。\n\n'
              'この画面は Navigator.push() で遷移してきた画面です。\n\n'
              'AppBar の戻るボタンか、Navigator.pop() で前の画面に戻ることができます。',
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

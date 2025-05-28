import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PracticeLayout(),
    );
  }
}

class PracticeLayout extends StatelessWidget {
  const PracticeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("タイトル"), backgroundColor: Colors.lightGreen),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(title: "Text"),

              /// Textエリア。
              Text(
                "Hello World",

                /// テキストのスタイルを指定する。
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),

                /// テキストの位置を指定する。
                textAlign: TextAlign.center,

                /// テキストが長すぎる場合に、省略する（...が表示される）
                overflow: TextOverflow.ellipsis,

                /// テキストの最大行数を指定する。
                maxLines: 1,
              ),

              SizedBox(height: 16),

              /// Iconエリア。
              _Header(title: "Icon"),
              Icon(Icons.home, size: 30, color: Colors.blue),

              SizedBox(height: 16),

              /// Imageエリア。
              _Header(title: "Image"),
              Image.network(
                "https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png",
                width: 300,

                /// fit:
                fit: BoxFit.fitWidth,

                /// 画像が読み込まれている時に表示させるWidget.
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },

                /// エラーが発生した時に表示させるWidget.
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text("Error: $error"));
                },
              ),

              SizedBox(height: 16),

              /// Buttonエリア。
              _Header(title: "Button"),
              ElevatedButton(
                onPressed: () {
                  print("Button pressed");
                },
                // 見た目はここから指定する
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                // 表示したい内容
                child: Text(
                  "ボタン",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Containerエリア。
              _Header(title: "Container"),
              Container(
                width: 200,
                // childのalignment（配置）を設定できる
                alignment: Alignment.center,
                // padding: 余白の設定をできる
                padding: const EdgeInsets.all(16),
                // decoration: 形などを変更できる
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                //
                child: Text(
                  "コンテナ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              SizedBox(height: 16),

              _Header(title: "GestureDetector, InkWell"),

              GestureDetector(
                onTap: () {
                  print("GestureDetectorをタップしました。");
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.red,
                  child: Text(
                    "GestureDetector",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 16),

              InkWell(
                onTap: () {
                  print("InkWellをタップしました。");
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue,
                  child: Text("InkWell", style: TextStyle(color: Colors.white)),
                ),
              ),

              SizedBox(height: 16),

              _Header(title: "Container以外"),

              // width, heightだけ設定したい場合はSizedBox
              SizedBox(width: 100, child: Text("サイズだけ調整")),

              SizedBox(height: 16),

              // 余白だけ設定したい（padding）場合、Padding.
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("余白だけ設定"),
              ),

              SizedBox(height: 16),

              /// 配置だけ設定したい場合, Align.
              Align(alignment: Alignment.center, child: Text("配置だけ設定")),

              _Header(title: "Column"),

              /// Column。縦方向にWidgetを詰め込める.
              Column(
                /// 横方向の配置を決める。未指定だとcenter.
                crossAxisAlignment: CrossAxisAlignment.start,

                /// 縦方向の配置を決める。未指定だとstart.
                mainAxisAlignment: MainAxisAlignment.start,

                /// 各Widgetに隙間を設定する.
                spacing: 5.0,
                children: [
                  Text("Hello World", style: TextStyle(fontSize: 16)),
                  Text("Hello World 2", style: TextStyle(fontSize: 16)),
                  Text("Hello World 3", style: TextStyle(fontSize: 16)),
                ],
              ),

              SizedBox(height: 16),

              _Header(title: "Row"),

              Row(
                children: [
                  Icon(Icons.home, size: 30, color: Colors.blue),
                  Icon(Icons.star, size: 30, color: Colors.blue),
                  Icon(Icons.car_crash, size: 30, color: Colors.blue),
                ],
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

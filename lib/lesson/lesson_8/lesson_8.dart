import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// httpを使用する場合は、このように名前付きでインポートをする必要があり。
/// （ライブラリに存在するメソッドを直接使用するため）
import 'package:http/http.dart' as http;

part 'lesson_8.freezed.dart';

/// freezedクラスにfromJsonなどを追加するためには、こちらが必要です。
part 'lesson_8.g.dart';

class Lesson8Widget extends HookWidget {
  const Lesson8Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final textState = useState('');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 8'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const Text(
              //   'このレッスンでは、HTTPリクエストを送信してデータを取得する方法を学びます。',
              //   style: TextStyle(fontSize: 20),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // 取得した結果を、textStateにセットします。
                  textState.value = await fetchData();
                },
                child: const Text('データを取得'),
              ),
              const SizedBox(height: 20),
              Text(
                textState.value,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// httpを使って、データを取得する
  /// 今回は、東京都のオープンデータAPIを利用します。
  /// https://portal.data.metro.tokyo.lg.jp/opendata-api/
  Future<String> fetchData() async {
    try {
      /// ベースとなるURLを設定。
      final baseUrl = 'https://api.data.metro.tokyo.lg.jp/v1';

      /// apiのpathを指定。（APIにより異なる）
      final path = '/CulturalProperty'; // ここは実際のAPIのエンドポイントに合わせて変更してください。
      final response = await http.get(
        Uri.parse(
          "$baseUrl$path?ID=0000000008", // ここに実際のエンドポイントを指定してください
        ),
      );

      if (response.statusCode == 200) {
        print('データ取得成功: ${response.body}');
      } else {
        print('エラー: ${response.statusCode}');
      }
      return response.body;
    } catch (e) {
      print('エラーが発生しました: $e');
      rethrow; // エラーを再スローして、呼び出し元で処理できるようにする
    }
  }

  /// dioを使って、データを取得する
  Future<String> fetchDataWithDio() async {
    // Dioを使った実装はここに追加できます。
    Dio dio = Dio();

    /// ベースとなるURLを設定。
    final baseUrl = 'https://api.data.metro.tokyo.lg.jp/v1';
    final response = await dio.get('$baseUrl/PublicFacility');
    return response.data.toString();
  }
}

class Car {
  final String name;
  final String brand;
  final int year;
  final int price;
  // final Color color; // 色は、freezedではサポートされていないため、削除
  final String? ownerName;

  const Car({
    required this.name,
    required this.brand,
    required this.year,
    required this.price,
    this.ownerName,
  });

  /// fromJsonを定義し、JSONからCarオブジェクトを生成する
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['name'] as String,
      brand: json['brand'] as String,
      year: json['year'] as int,
      price: json['price'] as int,
      ownerName: json['ownerName'] as String?,
    );
  }
}

/// freezedは、イミュータブルなデータクラスを簡単に作成できます。
@freezed
abstract class FreezedCar with _$FreezedCar {
  const factory FreezedCar({
    @Default("") String name, // デフォルト値を設定などできる
    required String brand,
    required int year,
    required int price,
    String? ownerName,
  }) = _FreezedCar;

  /// freezedでは、以下の形式で書けば、自動でfromJson、toJsonメソッドが生成されます。
  /// 1. part '(ファイル名).g.dart'; // これを追加
  /// 2. freezedクラスに以下形式でfromJsonを定義
  factory FreezedCar.fromJson(Map<String, dynamic> json) =>
      _$FreezedCarFromJson(json);
}

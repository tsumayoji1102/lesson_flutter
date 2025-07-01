import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// freezedクラスを作成する場合、こちらが必要
part 'lesson_7.freezed.dart';

/// 実行用。
void main() {
  // インスタンスのメソッドを呼び出す
  car.description();

  // クラスの静的メソッドを呼び出す
  Car.staticDescription();

  car.color = Colors.blue; // インスタンスのフィールドを変更

  // インスタンスのフィールドにアクセス
  print('車の名前: ${car.name}');
  print('車のブランド: ${car.brand}');
  print('車の年式: ${car.year}');
  print('車の価格: ${car.price}');
  print('車の色: ${car.color}');
}

/// 車のクラス。
class Car {
  final String name;
  final String brand;
  String? ownerName;
  final int year;
  final int price;
  Color color;

  Car({
    required this.name,
    required this.brand,
    required this.year,
    required this.price,
    required this.color,
    this.ownerName,
  });

  /// このインスタンスに関しての説明を出力するメソッド.
  /// クラスのメソッドは、生成されたインスタンスに対して呼び出すことができます。
  /// 例えば、`car.description()`のように使用します。
  void description() {
    print("これは $name という車です。");
    print("ブランドは $brand で、$year 年に製造されました。");
    if (ownerName != null) {
      print("オーナーは $ownerName です。");
    }
  }

  /// クラスの静的（static）メソッドは、インスタンスを生成せずに呼び出すことができます。
  /// ただし、静的メソッドはインスタンスのフィールドにアクセスできません。（$name や $brand などは使えません）
  /// ここでフィールドの値を使いたい場合、フィールドをstaticにする必要があります。
  static void staticDescription() {
    print("これは車のクラスです。");
    print("車の情報を管理するためのクラスです。");
  }
}

/// freezedを使用してCarモデルを定義することもできます。
/// freezedは、Dartのコード生成ライブラリで、イミュータブルなデータクラスを簡単に作成できます。
@freezed
abstract class FreezedCar with _$FreezedCar {
  const factory FreezedCar({
    @Default("") String name, // デフォルト値を設定などできる
    required String brand,
    required int year,
    required int price,
    required Color color,
    String? ownerName,
  }) = _FreezedCar;

  /// freezedでは、toString()やhashCode、==演算子などのメソッドも自動生成されます。
  /// これにより、データクラスの比較や表示が簡単になります。
}

var car = Car(
  name: 'Model S',
  brand: 'Tesla',
  year: 2020,
  price: 80000,
  color: Colors.red,
  ownerName: 'John Doe',
);

class Lesson7Widget extends StatelessWidget {
  Lesson7Widget({super.key});

  final cars = [
    Car(
      name: 'Model S',
      brand: 'Tesla',
      year: 2020,
      price: 80000,
      color: Colors.red,
      ownerName: 'John Doe',
    ),
    Car(
      name: 'Mustang',
      brand: 'Ford',
      year: 2019,
      price: 55000,
      color: Colors.blue,
    ),
    Car(
      name: 'Civic',
      brand: 'Honda',
      year: 2021,
      price: 25000,
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 7'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // 車の一覧を表示。
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarListTile(car: cars[index]);
        },
      ),
    );
  }
}

/// Carモデル専用に作成されたListTileウィジェット。
/// ListTileは、リストのアイテムを表示するための便利なウィジェットです。
/// Carモデルに限定するため、型が安全になります。
class CarListTile extends StatelessWidget {
  const CarListTile({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(car.name),
      subtitle: Text('${car.brand} - ${car.year}'),
      trailing: Text('\$${car.price}'),
      leading: CircleAvatar(
        backgroundColor: car.color,
        child: Text(car.name[0]),
      ),
      onTap: () {
        // タップされたときの処理
        print('Tapped on ${car.name}');
      },
    );
  }
}

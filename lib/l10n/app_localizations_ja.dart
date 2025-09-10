// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'レッスン Flutter';

  @override
  String get welcome => 'ようこそ';

  @override
  String get hello => 'こんにちは';

  @override
  String helloWithName(String name) {
    return 'こんにちは、$nameさん！';
  }

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get english => '英語';

  @override
  String get japanese => '日本語';

  @override
  String get login => 'ログイン';

  @override
  String get logout => 'ログアウト';

  @override
  String get email => 'メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get submit => '送信';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get loading => '読み込み中...';

  @override
  String get error => 'エラー';

  @override
  String get retry => '再試行';

  @override
  String get noDataAvailable => '利用可能なデータがありません';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のアイテム',
      zero: 'アイテムなし',
    );
    return '$_temp0';
  }
}

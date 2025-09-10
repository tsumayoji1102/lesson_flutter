import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lesson_flutter/l10n/app_localizations.dart';

class LocalizationDemoPage extends HookWidget {
  const LocalizationDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 状態管理
    final itemCount = useState<int>(0);
    final userName = useState<String>('User');

    // メソッド定義
    final incrementCount = useCallback(() {
      itemCount.value++;
    }, [itemCount]);

    final decrementCount = useCallback(() {
      if (itemCount.value > 0) {
        itemCount.value--;
      }
    }, [itemCount]);

    final changeUserName = useCallback((String newName) {
      userName.value = newName.isEmpty ? 'User' : newName;
    }, [userName]);

    // ローカライズされた文字列を取得できます
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // ウェルカムセクション
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    l10n.welcome,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.helloWithName(userName.value),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: l10n.email, // 名前入力の代わりにemailラベルを使用
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: changeUserName,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // アイテムカウント & ボタンセクション
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      l10n.itemCount(itemCount.value),
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: incrementCount,
                        icon: const Icon(Icons.add),
                        label: Text(l10n.save), // 追加の代わりにsaveを使用
                      ),
                      ElevatedButton.icon(
                        onPressed: decrementCount,
                        icon: const Icon(Icons.remove),
                        label: Text(l10n.cancel), // 削除の代わりにcancelを使用
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

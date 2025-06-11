import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Lesson5Widget extends HookWidget {
  const Lesson5Widget({super.key});

  @override
  Widget build(BuildContext context) {
    // HookWidgetを使うと、useStateなどのフックを使える。
    //
    // ここでは、カウントの状態を管理するためのuseStateを使っている。
    // useStateは、状態を保持するためのフックで、状態が変わると自動的に再描画される。
    // ここでは、初期値を0に設定している。
    final countState = useState(0);

    // useRefは、値を保持するためのフックで、状態が変わっても再描画されない。
    final countRef = useRef(0);

    // useMemoizedは、値をメモ化するためのフックで、依存する値が変わらない限り再計算されない。
    // ここでは、TextEditingControllerを作成している。
    final textController = useMemoized(() {
      return TextEditingController();
    });

    useEffect(() {
      // useEffectは、ウィジェットが初めて描画されたときや、依存する値が変わったときに呼ばれる。
      // ここでは、ウィジェットが初めて描画されたときに1回だけ呼ばれる。
      print('useEffect: 初期化処理');

      // クリーンアップ処理（dispose)を返すこともできる。
      return () {
        print('useEffect: クリーンアップ処理');
      };
    }, [countState.value]); // countState.valueが変わると再実行される。
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 5'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // useStateで管理しているcountStateの値を表示する。
            // countState.valueを使うことで、現在の値を取得できる。
            Text(countState.value.toString(), style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                // ボタンを押すと、countStateの値を1増やす。
                // countState.value++は、現在の値に1を足して再設定する。
                countState.value++;
              },
              child: const Text('+1'),
            ),
          ],
        ),
      ),
    );
  }
}

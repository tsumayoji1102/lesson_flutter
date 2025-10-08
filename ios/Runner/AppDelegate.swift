import Flutter
import UIKit
import AudioToolbox
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    /** FlutterViewControllerを取得
    *.  iOS上でFlutterを表示するための画面（このインスタンスでFlutterは動いている）
    */
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

    /** チャンネルをここで定義する */
    let soundChannel = FlutterMethodChannel(
      name: "example", 
      binaryMessenger: controller.binaryMessenger
    )
    /** チャンネルのメソッドをここで定義する. 
    *.  Flutter側で呼び出されたら、ここが実行される。
    *.  call.methodでメソッド名を取得できるので、条件分岐して処理を分ける。
    */
    soundChannel.setMethodCallHandler { call, result in
        if call.method == "playSound" {
            /** SMS受信音を鳴らすメソッド */
            AudioServicesPlaySystemSound(1007) 
            /** 何かしら結果を返す。nilはvoidとして扱われる。 */
            result(nil)
        }
        if call.method == "getText" {
            result("iOS最高")
        }
        if call.method == "vibrate" {
            self.vibrate()
            result("バイブレーションしました")
        }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  /** バイブレーションを実行するメソッド */
  private func vibrate() {
    // iOS 10以降でHaptic Feedbackを使用
    if #available(iOS 10.0, *) {
      let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
      impactFeedback.impactOccurred()
    } else {
      // iOS 9以前では従来のバイブレーション
      AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
  }
}

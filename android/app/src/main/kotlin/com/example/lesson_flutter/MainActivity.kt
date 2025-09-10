package com.example.lesson_flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.media.RingtoneManager
import android.net.Uri

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // システム音のチャンネル設定
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "demo/sound")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "playSound" -> {
                        playSystemSound()
                        result.success(null)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }
    
    // システム音を再生するメソッド
    private fun playSystemSound() {
        try {
            val notification: Uri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION)
            val ringtone = RingtoneManager.getRingtone(applicationContext, notification)
            ringtone.play()
        } catch (e: Exception) {
            // エラーハンドリング（ログ出力など）
            e.printStackTrace()
        }
    }
}

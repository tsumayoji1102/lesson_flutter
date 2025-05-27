import 'package:flutter/material.dart';

class CafeMenuScreen extends StatelessWidget {
  const CafeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _Header(), backgroundColor: Colors.brown[400]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 2. 商品セクション3つ
            _buildDrinkSection(),
            _buildFoodSection(),
            _buildDessertSection(),

            // 3. 下部の余白
            Container(height: 20),
          ],
        ),
      ),
    );
  }

  // ドリンクセクション
  Widget _buildDrinkSection() {
    return _MenuSection(
      categoryName: 'ドリンクメニュー',
      itemName: 'コーヒー',
      price: '￥300',
      icon: Icons.coffee,
      themeColor: Colors.blue,
      isFirstSection: true,
    );
  }

  // フードセクション
  Widget _buildFoodSection() {
    return _MenuSection(
      categoryName: 'フードメニュー',
      itemName: 'サンドイッチ',
      price: '￥500',
      icon: Icons.lunch_dining,
      themeColor: Colors.orange,
      isFirstSection: false,
    );
  }

  // デザートセクション
  Widget _buildDessertSection() {
    return _MenuSection(
      categoryName: 'デザートメニュー',
      itemName: 'ケーキ',
      price: '￥400',
      icon: Icons.cake,
      themeColor: Colors.pink,
      isFirstSection: false,
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_cafe, color: Colors.white, size: 32),
          SizedBox(width: 12),
          Text(
            'Cafe Menu',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection({
    required this.categoryName,
    required this.itemName,
    required this.price,
    required this.icon,
    required this.themeColor,
    required this.isFirstSection,
  });

  final String categoryName;
  final String itemName;
  final String price;
  final IconData icon;
  final Color themeColor;
  final bool isFirstSection;

  @override
  Widget build(BuildContext context) {
    // 共通のメニューセクションを作成する関数
    return Container(
      margin:
          isFirstSection
              ? EdgeInsets.all(16)
              : EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themeColor.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // 商品アイコン
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: themeColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 40,
              color: themeColor.withValues(alpha: 0.8),
            ),
          ),

          SizedBox(width: 16),

          // 商品情報（商品名と価格）
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: themeColor.withValues(alpha: 0.9),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  itemName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 注文ボタン
          ElevatedButton(
            onPressed: () {
              print('${itemName}を注文しました');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColor.withValues(alpha: 0.8),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('注文', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class ShoppingCart {
  List<String> _items = [];

  void addItem(String item) {
    if (item.isEmpty) throw ArgumentError('商品名は必須です');
    _items.add(item);
  }

  bool removeItem(String item) {
    return _items.remove(item);
  }

  String getStatus() {
    if (_items.length >= 5) return 'フル';
    if (_items.length >= 1) return '使用中';
    return '空';
  }

  int get itemCount => _items.length;
}

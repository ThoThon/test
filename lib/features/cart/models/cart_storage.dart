import 'package:hive/hive.dart';

import 'cart_item.dart';

class CartStorage {
  static const String boxName = 'cartBox';
  static const String keyCartItems = 'cart_items';

  static Box<List> get _box => Hive.box<List>(boxName);

  static Future<void> addToCart(CartItem item) async {
    final currentItems = getCartItems();

    // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    final existingIndex = currentItems.indexWhere(
      (cartItem) => cartItem.productId == item.productId,
    );

    if (existingIndex >= 0) {
      // Nếu đã có, tăng số lượng
      currentItems[existingIndex] = currentItems[existingIndex].copyWith(
        quantity: currentItems[existingIndex].quantity + item.quantity,
      );
    } else {
      // Nếu chưa có, thêm mới
      currentItems.add(item);
    }

    await _box.put(keyCartItems, currentItems.map((e) => e).toList());
  }

  static List<CartItem> getCartItems() {
    final data = _box.get(keyCartItems);
    if (data == null) return [];

    return data.cast<CartItem>();
  }

  static Future<void> removeFromCart(int productId) async {
    final currentItems = getCartItems();
    currentItems.removeWhere((item) => item.productId == productId);
    await _box.put(keyCartItems, currentItems.map((e) => e).toList());
  }

  static Future<void> updateQuantity(int productId, int newQuantity) async {
    if (newQuantity <= 0) {
      await removeFromCart(productId);
      return;
    }

    final currentItems = getCartItems();
    final index = currentItems.indexWhere(
      (item) => item.productId == productId,
    );

    if (index >= 0) {
      currentItems[index] = currentItems[index].copyWith(quantity: newQuantity);
      await _box.put(keyCartItems, currentItems.map((e) => e).toList());
    }
  }

  static Future<void> clearCart() async {
    try {
      await _box.delete(keyCartItems);
      print("Đã xóa tất cả sản phẩm trong giỏ hàng");
    } catch (e) {
      print("Lỗi khi xóa giỏ hàng: $e");
      await _box.clear();
    }
  }

  static int get itemCount {
    final items = getCartItems();
    return items.fold(0, (total, item) => total + item.quantity);
  }

  static int get totalPrice {
    final items = getCartItems();
    return items.fold(0, (total, item) => total + item.totalPrice);
  }
}

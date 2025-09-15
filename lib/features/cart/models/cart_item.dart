import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int price;

  @HiveField(3)
  final String cover;

  @HiveField(4)
  final int quantity;

  @HiveField(5)
  final DateTime addedAt;

  CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.cover,
    this.quantity = 1,
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();

  CartItem copyWith({
    int? productId,
    String? name,
    int? price,
    String? cover,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      cover: cover ?? this.cover,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  int get totalPrice => price * quantity;
}

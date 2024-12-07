import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 0)
class CartItem {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final String image;

  @HiveField(3)
  int quantity;

  CartItem({
    required this.title,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}

import 'package:product_cart_app/model/product_model.dart';

abstract class ProductEvent{}

class LoadProducts extends ProductEvent{}


class AddToCart extends ProductEvent{
  final ProductModel products;
  AddToCart(this.products);
}

class RemoveFromCart extends ProductEvent{
  final ProductModel products;
  RemoveFromCart(this.products);
}

class IncrementQuantity extends ProductEvent {
  final ProductModel product;
  IncrementQuantity(this.product);
}
class DecrementQuantity extends ProductEvent {
  final ProductModel product;
  DecrementQuantity(this.product);
}
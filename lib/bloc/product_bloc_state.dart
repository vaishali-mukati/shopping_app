import 'package:product_cart_app/model/product_model.dart';

abstract class ProductState{}

class ProductLoadingState extends ProductState{}

class ProductLoaded extends ProductState{
  final List<ProductModel> products;
  final List<ProductModel> cart;
  ProductLoaded(this.products,this.cart);
}

class ProductError extends ProductState{
  final String message;
   ProductError(this.message);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_bloc_state.dart';
import 'cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFFCE4EC),
      appBar: AppBar(
        title: Center(child: Text('Cart')),
        backgroundColor:Color(0xFFFCE4EC) ,

      ),
body: Column(
  children: [
    BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded && state.cart.isNotEmpty) {
          final cartItem = state.cart;
       //   double totalPrice = state.cart.fold(0, (sum, item) => sum + item.discountedPrice);
          return
              Expanded(
                child: ListView.builder(
                  itemCount: cartItem.length,
                  itemBuilder: (context, index) {
                    final product = cartItem[index];
                    return CartItemTile(productModel: product,);
                  }),
              );
        } else {
          return Center(child: Text("Your cart is empty"));
        }
      },
    ),
    Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.start,
       //  crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BlocBuilder<ProductBloc,ProductState>(
            builder: (context, state) {
              double totalPrice = 0;
              int totalItems = 0;

              if (state is ProductLoaded) {
                totalPrice = state.cart.fold(0, (sum, item) => sum + (item.price * item.quantity));
                totalItems = state.cart.fold(0, (sum, item) => sum + item.quantity);
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      Text("Amount Price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8,),
                      Text("₹${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                    ],
                  ),
                  SizedBox(height: 10),
                      ElevatedButton(
                      onPressed: () {
                        // TODO: Implement Checkout functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Check Out", style: TextStyle(fontSize: 18)),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Text("$totalItems",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red)),
                          )
                        ],
                      ),
                    ),],
                  );}
              )
                ],
              ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_bloc_event.dart';
import '../model/product_model.dart';

class CartItemTile extends StatefulWidget {
  final ProductModel productModel;
  const CartItemTile({super.key,required this.productModel,});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  int quantity =1;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(widget.productModel.thumbnail,width: 150,height: 150,fit: BoxFit.cover,),
              SizedBox(width: 12,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.productModel.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  Text(widget.productModel.brand,style: TextStyle(
                      fontSize: 14
                  ),),
                  Row(
                    children: [
                      Text('₹${widget.productModel.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10,
                        ),),
                      SizedBox(width: 8,),
                      Text('₹${widget.productModel.discountedPrice.toStringAsFixed(2)}',style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  Text('${widget.productModel.discountPercentage}% OFF',style: TextStyle(
                      fontSize: 12,
                      color: Colors.pinkAccent
                  ),),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity =quantity--;
                          });
                        },
                        icon: Icon(Icons.remove, color: Colors.red),
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                         setState((){
                           quantity = quantity++;
                         });
                        },
                        icon: Icon(Icons.add, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
      ),
    );

  }
}

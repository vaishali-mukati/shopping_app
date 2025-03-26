import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_bloc_event.dart';
import '../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Card(
       elevation: 4.0,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Expanded(child: Image.network(productModel.thumbnail,width: double.infinity,
           fit: BoxFit.cover,
           )),
           Padding(padding: EdgeInsets.only(top:8,left: 8),
           child: Text(productModel.title,
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 16
           ),
           ),),
           Padding(padding: EdgeInsets.only(left: 8,top: 2,bottom: 4),
           child: Text(productModel.brand,style: TextStyle(
             fontSize: 14
           ),),),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Row(
               children: [
                 Text('₹${productModel.price.toStringAsFixed(2)}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                   fontSize: 10,
                 ),),
                 SizedBox(width: 8,),
                 Text('₹${productModel.discountedPrice.toStringAsFixed(2)}',style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.bold
                 ),),
               ],
             ),
           ),
           Padding(
             padding: EdgeInsets.only(left: 8),
             child: Text('${productModel.discountPercentage}% OFF',style: TextStyle(
               fontSize: 12,
                 color: Colors.pinkAccent
             ),),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(
               onPressed: () {
                 context.read<ProductBloc>().add(AddToCart(productModel));
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added into cart')));
               },
               child: const Text('Add to Cart'),
             ),
           ),

         ],
       ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/bloc/product_bloc.dart';
import 'package:product_cart_app/bloc/product_bloc_state.dart';
import 'package:product_cart_app/model/product_model.dart';
import 'package:product_cart_app/screens/cart_screen.dart';
import 'package:product_cart_app/screens/product_card.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCE4EC),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCE4EC),
        title: Center(child: Text('Catalogue')),
        actions: [
          BlocBuilder<ProductBloc,ProductState>(
            builder: (context, state) {
              int itemCount = 0 ;
              if(state is ProductLoaded){
                  itemCount = state.cart.length;
                print('---------added cart --------$itemCount');
              }
              return Stack(
                children:[ IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CartScreen()));
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
                  if(itemCount > 0)
                    Positioned(
                        right: 5,
                        top: 5,
                        child:Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle
                          ),
                          constraints: BoxConstraints(
                            minWidth: 18,
                            minHeight: 18
                          ),
                            child: Text(itemCount.toString(),style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),),
                        ))
              ]);
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLoaded) {
          return GridView.builder(
              itemCount: state.products.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                ProductModel productModel = state.products[index];
                return ProductCard(productModel: productModel);
              });


          // ListView.builder(
          //   itemCount: state.products.length,
          //   itemBuilder: (context, index) {
          //     ProductModel productModel = state.products[index];
          //     return Card(
          //       child: ListTile(
          //         leading: Image.network(
          //           productModel.thumbnail,
          //           width: 50,
          //           height: 50,
          //           fit: BoxFit.cover,
          //         ),
          //         title: Text(productModel.title),
          //         subtitle: Text('₹${productModel.discountedPrice.toStringAsFixed(2)}'),
          //         trailing: ElevatedButton(onPressed: (){
          //           context.read<ProductBloc>().add(AddToCart(productModel));
          //         }, child:Text('Add')),
          //       ),
          //     );
          //   });
        } else if (state is ProductError) {
          return Center(child:
          Text('Something went wrong to load products'),);
        } else {
          return Text('NO data ');
        }
      }),
    );
  }
}

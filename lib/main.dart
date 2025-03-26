import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/bloc/product_bloc.dart';
import 'package:product_cart_app/bloc/product_bloc_event.dart';
import 'package:product_cart_app/repository/product_repo.dart';
import 'package:product_cart_app/screens/catalogue_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(create: (context) => ProductBloc(ProductRepository())..add(LoadProducts()),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogueScreen(),
    ),
    );
  }
 }
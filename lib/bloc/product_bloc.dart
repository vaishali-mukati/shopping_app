import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/bloc/product_bloc_event.dart';
import 'package:product_cart_app/bloc/product_bloc_state.dart';
import 'package:product_cart_app/model/product_model.dart';
import 'package:product_cart_app/repository/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
   final ProductRepository productRepository;
   List<ProductModel> cart = [];

   ProductBloc(this.productRepository) : super(ProductLoadingState()){
     on<LoadProducts>((event, emit) async {
       try {
         List<ProductModel> products = await productRepository.fetchProducts(10, 0);
         emit(ProductLoaded(products, cart));
       } catch (e) {
         emit(ProductError("Failed to load products"));
       }
     });

     on<AddToCart>((event, emit) {
       cart.add(event.products);
       emit(ProductLoaded((state as ProductLoaded).products, List.from(cart)));

     });

     on<RemoveFromCart>((event, emit) {
       cart.remove(event.products);
       emit(ProductLoaded((state as ProductLoaded).products, cart));
     });


   }
}
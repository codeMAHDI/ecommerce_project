import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:ecommerce/presentation/bloc/product/product_event.dart';
import 'package:ecommerce/presentation/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadProductDetails>(_onLoadProductDetails);
    on<LoadPopularProducts>(_onLoadPopularProducts);
    on<LoadCategories>(_onLoadCategories);
  }


  Future<void> _onLoadProducts(
      LoadProducts event,
      Emitter<ProductState> emit,
      ) async {
    try {
      emit(ProductLoading());
      final products = await _productRepository.getProducts();
      emit(PopularProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }



  Future<void> _onLoadProductDetails(
      LoadProductDetails event,
      Emitter<ProductState> emit,
      ) async {
    try {
      emit(ProductLoading());
      final product = await _productRepository.getProductDetails(
          event.productId
      );
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }


  Future<void> _onLoadPopularProducts(
    LoadPopularProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(ProductLoading());
      final products = await _productRepository.getPopularProducts();
      emit(PopularProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(ProductLoading());
      final categories = await _productRepository.getCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}

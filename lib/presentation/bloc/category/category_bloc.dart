import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:ecommerce/presentation/bloc/category/category_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductRepository _productRepository;

  CategoryBloc({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(CategoryInitial()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(CategoryLoading());
      final categories = await _productRepository.getCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}

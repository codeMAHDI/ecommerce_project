import 'package:ecommerce/data/models/category_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable{
  const ProductState();
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState{}

class ProductLoading extends ProductState{}

class CategoriesLoaded extends ProductState{
  final List<Category> categories;
  const CategoriesLoaded(this.categories);
  @override
  List<Object?> get props => [categories];
}

class PopularProductsLoaded extends ProductState{
  final List<Product> products;
  const PopularProductsLoaded(this.products);
  @override
  List<Object?> get props => [products];
}

class ProductDetailLoaded extends ProductState{
  final Product product;
  const ProductDetailLoaded(this.product);
  @override
  List<Object?> get props => [product];
}


class ProductError extends ProductState{
  final String message;
  const ProductError(this.message);
  @override
  List<Object?> get props => [message];
}




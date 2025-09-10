import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent{
  const LoadProducts();
}

class LoadProductDetails extends ProductEvent{
final  int productId;
  const LoadProductDetails(this.productId);
  @override
  List<Object?> get props => [productId];
}

class LoadPopularProducts extends ProductEvent {
  const LoadPopularProducts();
}

class LoadCategories extends ProductEvent {
  const LoadCategories();
}

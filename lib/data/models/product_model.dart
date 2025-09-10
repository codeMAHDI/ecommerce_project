import 'package:ecommerce/data/models/category_model.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String shortDes;
  final String price;
  final String discount;
  final String discountPrice;
  final String image;
  final int stock;
  final int star;
  final String remark;
  final int categoryId;
  final int brandId;
  final Brand brand;
  final Category category;

  Product({
    required this.id,
    required this.title,
    required this.shortDes,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.image,
    required this.stock,
    required this.star,
    required this.remark,
    required this.categoryId,
    required this.brandId,
    required this.brand,
    required this.category,
  });

  factory Product.fromJson(Map<String,dynamic>json){
    return Product(
        id: json['id'],
        title: json['title'],
        shortDes: json['shortDes'],
        price: json['price'],
        discount: json['discount'],
        discountPrice:json ['discountPrice'],
        image: json['image'],
        stock: json['stock'],
        star: json['star'],
        remark: json['remark'],
        categoryId: json['categoryId'],
        brandId: json['brandId'],
        brand: json['brand'],
        category:json ['category']
    );
  }

  @override

  List<Object?> get props => [
    id,
    title,
    shortDes,
    price,
    discount,
    discountPrice,
    image,
    stock,
    star,
    remark,
    categoryId,
    brandId,
    brand,
    category
  ];

}

class Brand extends Equatable {
  final int id;
  final String brandName;
  final String brandImg;

  const Brand({
    required this.id,
    required this.brandName,
    required this.brandImg,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      brandName: json['brandName'],
      brandImg: json['brandImg'],
    );
  }

  @override
  List<Object?> get props => [id, brandName, brandImg];
}


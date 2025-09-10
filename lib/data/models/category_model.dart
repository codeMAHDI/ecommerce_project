import 'package:equatable/equatable.dart';
class Category extends Equatable {
  final int id;
  final String categoryName;
  final String categoryImg;

  const Category({
    required this.id,
    required this.categoryName,
    required this.categoryImg,
  });
  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
        id: json['id'],
        categoryName: json['categoryName'],
        categoryImg: json['categoryImg']
    );
  }
  @override
  List<Object?> get props => [id, categoryName, categoryImg];
}

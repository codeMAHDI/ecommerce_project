import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/data/models/category_model.dart';
import 'package:flutter/material.dart';
class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;
  const CategoryCard({Key? key, required this.category,  this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(padding: const EdgeInsets.all(16.0),
            child: CachedNetworkImage(
              imageUrl: category.categoryImg,
              placeholder:
              (context,url)=> const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primaryColor,
                ),
              ),
              errorWidget: (context, url, error)=>const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            category.categoryName,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

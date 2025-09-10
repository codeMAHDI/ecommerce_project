import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({Key? key, required this.product, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: CachedNetworkImage(
                      imageUrl: product.image,
                    placeholder:  (context,url)=> const Center(
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
            ),
            Padding(padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14
                  ),
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Text(
                      '৳${product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.primaryColor
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.star,color: Colors.yellow,),
                        Text(
                          '${product.star/20}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}

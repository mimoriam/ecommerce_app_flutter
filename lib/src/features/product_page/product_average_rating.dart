import 'package:ecommerce_app_flutter/src/constants/app_sizes.dart';
import 'package:ecommerce_app_flutter/src/models/product.dart';
import 'package:flutter/material.dart';

/// Shows the product average rating score and the number of ratings
class ProductAverageRating extends StatelessWidget {
  const ProductAverageRating({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        gapW8,
        Text(
          product.avgRating.toStringAsFixed(1),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        gapW8,
        Text(
          product.numRatings == 1 ? '1 rating' : '${product.numRatings} ratings',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
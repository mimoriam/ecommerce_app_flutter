import 'package:ecommerce_app_flutter/src/common/custom_image.dart';
import 'package:ecommerce_app_flutter/src/constants/app_sizes.dart';
import 'package:ecommerce_app_flutter/src/constants/test_products.dart';
import 'package:ecommerce_app_flutter/src/features/products/data/fake_products_repository.dart';
import 'package:ecommerce_app_flutter/src/localization/string_hardcoded.dart';
import 'package:ecommerce_app_flutter/src/features/cart/domain/item.dart';
import 'package:flutter/material.dart';

/// Shows an individual order item, including price and quantity.
class OrderItemListTile extends StatelessWidget {
  const OrderItemListTile({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    // TODO: Read from data source
    // final product = kTestProducts.firstWhere((product) => product.id == item.productId);
    final product = FakeProductsRepository.instance.getProduct(item.productId)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: CustomImage(imageUrl: product.imageUrl),
          ),
          gapW8,
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                gapH12,
                Text(
                  'Quantity: ${item.quantity}'.hardcoded,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
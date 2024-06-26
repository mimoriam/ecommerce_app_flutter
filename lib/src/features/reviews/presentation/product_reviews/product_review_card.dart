import 'package:ecommerce_app_flutter/src/common/alert_dialogs.dart';
import 'package:ecommerce_app_flutter/src/constants/app_sizes.dart';
import 'package:ecommerce_app_flutter/src/features/reviews/presentation/product_reviews/product_rating_bar.dart';
import 'package:ecommerce_app_flutter/src/features/reviews/domain/review.dart';
import 'package:ecommerce_app_flutter/src/utils/date_formatter.dart';
import 'package:flutter/material.dart';

/// Simple card widget to show a product review info (score, comment, date)
class ProductReviewCard extends StatelessWidget {
  const ProductReviewCard(this.review, {super.key});
  final Review review;
  @override
  Widget build(BuildContext context) {
    // TODO: Inject date formatter
    final dateFormatted = kDateFormatter.format(review.date);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductRatingBar(
                  initialRating: review.score,
                  ignoreGestures: true,
                  itemSize: 20,
                  // TODO: Implement onRatingUpdate
                  onRatingUpdate: (value) {
                    showNotImplementedAlertDialog(context: context);
                  },
                ),
                Text(dateFormatted, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            if (review.comment.isNotEmpty) ...[
              gapH16,
              Text(
                review.comment,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ],
        ),
      ),
    );
  }
}

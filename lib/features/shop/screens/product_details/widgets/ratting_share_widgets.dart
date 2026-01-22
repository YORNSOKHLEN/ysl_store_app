import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../features/shop/models/product_model.dart';

class YRattingAndShare extends StatelessWidget {
  const YRattingAndShare({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Ratting
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: YSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0 ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TextSpan(text: '(33)'),
                ],
              ),
            ),
          ],
        ),

        // Share  Button
        IconButton(
          onPressed: () {
            // Share functionality - can be implemented with share_plus package if needed
            // For now, just show a snackbar
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Sharing ${product.title}')));
          },
          icon: Icon(Icons.share, size: YSizes.iconMd),
        ),
      ],
    );
  }
}

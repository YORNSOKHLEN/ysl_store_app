import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class YRattingAndShare extends StatelessWidget {
  const YRattingAndShare({super.key});

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
          onPressed: () {},
          icon: Icon(Icons.share, size: YSizes.iconMd),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class YProductPriceText extends StatelessWidget {
  const YProductPriceText({
    super.key,
    this.maxLines = 1,
    required this.price,
    this.isLarge = false,
    this.currencySing = '\$',
    this.lineThrough = false,
  });

  final String price, currencySing;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySing + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            )
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            ),
    );
  }
}

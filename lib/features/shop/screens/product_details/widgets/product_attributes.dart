import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/chips/choice_chip.dart';
import 'package:ysl_store_app/common/widgets/texts/section_heading.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

class YProductAttributes extends StatelessWidget {
  const YProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YSectionHeading(title: 'Color', showActionButton: false),
            SizedBox(height: YSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                YChoiceChip(
                  text: 'Orange',
                  selected: true,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: 'Black',
                  selected: false,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: 'White',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YSectionHeading(title: 'Storage', showActionButton: false),
            SizedBox(height: YSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                YChoiceChip(
                  text: '256 GB',
                  selected: true,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: '512 GB',
                  selected: false,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: '1 TB',
                  selected: false,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: '2 TB',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

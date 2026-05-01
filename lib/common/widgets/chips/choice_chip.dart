import 'package:flutter/material.dart';
import 'package:fast_food/utils/constants/colors.dart';
import 'package:fast_food/utils/helpers/helper_functions.dart';

import '../custom_shapes/containers/circular_container.dart';

class YChoiceChip extends StatelessWidget {
  const YChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = YHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? YColors.white : null),
        avatar: isColor
            ? YCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: YHelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? CircleBorder() : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        padding: isColor ? EdgeInsets.all(0) : null,
        backgroundColor: isColor ? YHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}

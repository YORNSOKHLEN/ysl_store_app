import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../images/circular_image.dart';

class YUserProfileTile extends StatelessWidget {
  const YUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const YCircularImage(
        image: 'assets/images/user/user.png',
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Yorn Sokhlen',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: YColors.white),
      ),
      subtitle: Text(
        'yornsokhlen33@email.com',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: YColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Iconsax.edit, color: YColors.white),
      ),
    );
  }
}

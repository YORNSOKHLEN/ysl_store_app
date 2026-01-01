import 'package:get/get.dart';

import '../../screens/home/home.dart';
import '../../screens/profile/profile.dart';
import '../../screens/store/store.dart';
import '../../screens/wishlist/wishlist.dart';

class NavigationController extends GetxController {
  final page = [HomeScreen(), StoreScreen(), WishlistScreen(), ProfileScreen()];
  final selectedIndex = 0.obs;
}

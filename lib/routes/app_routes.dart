import 'package:get/get.dart';
import 'package:fast_food/routes/routes.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/widgets/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/sub_category/sub_categories.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: YRoutes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: YRoutes.store,
      page: () => const StoreScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: YRoutes.favourites,
      page: () => const FavouriteScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.settings,
      page: () => const SettingsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.subCategories,
      page: () => CategoriesScreen(
        categoryId: Get.arguments is String ? Get.arguments as String : '',
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.productReviews,
      page: () => const ProductReviewsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.order,
      page: () => const OrderScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.checkout,
      page: () => const CheckoutScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.cart,
      page: () => const CartScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.userProfile,
      page: () => const ProfileScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.userAddress,
      page: () => const UserAddressScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.signup,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.verifyEmail,
      page: () => const VerifyEmailScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: YRoutes.signIn,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.forgetPassword,
      page: () => const ForgetPassword(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: YRoutes.onboarding,
      page: () => const OnBoardingScreen(),
      transition: Transition.fadeIn,
    ),
    // Add more GetPage entries as needed
  ];
}

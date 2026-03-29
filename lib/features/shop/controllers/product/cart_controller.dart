import 'package:get/get.dart';
import 'package:ysl_store_app/features/shop/controllers/product/variation_controller.dart';

import '../../../../utils/constants/enums.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/cart_item_model.dart';
import '../../models/product_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  final variationController = VariationController.instance;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  /// ADD TO CART
  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      YLoaders.customToast(message: 'Select Quantity');
      return;
    }

    final isVariable = product.productType == ProductType.variable.toString();

    if (isVariable && variationController.selectedVariation.value.id.isEmpty) {
      YLoaders.customToast(message: 'Select Variation');
      return;
    }

    final variation = variationController.selectedVariation.value;
    final stock = isVariable ? variation.stock : product.stock;

    final alreadyInCart = isVariable
        ? getVariationQuantityInCart(product.id, variation.id)
        : getProductQuantityInCart(product.id);

    if (alreadyInCart + productQuantityInCart.value > stock) {
      YLoaders.warningSnackBar(
        title: 'Stock limit',
        message: 'Only $stock items available.',
      );
      return;
    }

    final cartItem = convertToCartItem(product, productQuantityInCart.value);

    final index = cartItems.indexWhere(
          (item) =>
      item.productId == cartItem.productId &&
          item.variationId == cartItem.variationId,
    );

    if (index >= 0) {
      cartItems[index].quantity += cartItem.quantity;
    } else {
      cartItems.add(cartItem);
    }

    updateCart();
    YLoaders.customToast(message: 'Product added to cart');
  }

  /// ADD ONE ITEM
  void addOneToCart(CartItemModel item) {
    final index = cartItems.indexWhere(
          (i) => i.productId == item.productId && i.variationId == item.variationId,
    );

    if (index == -1) return;

    cartItems[index].quantity++;
    updateCart();
  }

  /// REMOVE ONE ITEM
  void removeOneFromCart(CartItemModel item) {
    final index = cartItems.indexWhere(
          (i) => i.productId == item.productId && i.variationId == item.variationId,
    );

    if (index == -1) return;

    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      updateCart();
    } else {
      removeFromCartDialog(index);
    }
  }

  /// CONFIRM REMOVE
  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        YLoaders.customToast(message: 'Product removed from cart');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  /// -- Initialize already added Item's Count in the cart.
  void updateAlreadyAddedProductCount(ProductModel product) {
    // If product has no variations then calculate cartEntries and display total number.
    // Else make default entries to 0 and show cartEntries when variation is selected.
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      // Get selected Variation if any...
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(
          product.id,
          variationId,
        );
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }

  /// CONVERT PRODUCT → CART ITEM
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;

    final price = isVariation
        ? (variation.salePrice > 0 ? variation.salePrice : variation.price)
        : (product.salePrice > 0 ? product.salePrice : product.price);

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand?.name ?? '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  /// UPDATE CART
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    totalCartPrice.value = 0;
    noOfCartItems.value = 0;

    for (final item in cartItems) {
      totalCartPrice.value += item.price * item.quantity;
      noOfCartItems.value += item.quantity;
    }
  }

  void saveCartItems() {
    YLocalStorage.instance().saveData(
      'cartItems',
      cartItems.map((e) => e.toJson()).toList(),
    );
  }

  void loadCartItems() {
    final data = YLocalStorage.instance().readData<List<dynamic>>('cartItems');

    if (data != null) {
      cartItems.assignAll(data.map((e) => CartItemModel.fromJson(e)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
          (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}

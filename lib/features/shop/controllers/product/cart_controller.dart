import 'package:get/get.dart';

import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/cart_item_model.dart';
import '../../models/product_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  CartController();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

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

    final stock = product.stock;
    final alreadyInCart = getProductQuantityInCart(product.id);

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

  /// QUICK ADD ONE ITEM FROM PRODUCT CARD
  void addOneFromCard(ProductModel product) {
    final alreadyInCart = getProductQuantityInCart(product.id);
    if (alreadyInCart >= product.stock) {
      YLoaders.warningSnackBar(
        title: 'Stock limit',
        message: 'Only ${product.stock} items available.',
      );
      return;
    }

    final cartItem = convertToCartItem(product, 1);
    final index = cartItems.indexWhere(
      (item) =>
          item.productId == cartItem.productId &&
          item.variationId == cartItem.variationId,
    );

    if (index >= 0) {
      cartItems[index].quantity += 1;
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
    productQuantityInCart.value = getProductQuantityInCart(product.id);
  }

  /// CONVERT PRODUCT → CART ITEM
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final price = product.salePrice > 0 ? product.salePrice : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: '',
      image: product.thumbnail,
      brandName: product.brand?.name ?? '',
      selectedVariation: null,
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


  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}

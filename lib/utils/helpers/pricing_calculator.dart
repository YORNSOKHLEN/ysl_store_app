class YPricingCalculator {
  /// Calculates price based on tax and shipping.
  static double calculateTotalPrice(double productPrice, String location) {
    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + shippingCost;
    return totalPrice;
  }

  /// Calculates shipping cost
  static String calculateShippingCost(double subTotal, String location) {
    double shippingCost = 2.0; // always $2
    return shippingCost.toStringAsFixed(2);
  }

  /// Calculates tax
  static String calculateTaxAmount(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    return 0.0; // 10% tax rate for demonstration
  }

  static double getShippingCost(String location) {
    return 2.00; // Flat $5 shipping for demonstration
  }
}

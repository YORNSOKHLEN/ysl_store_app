import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/list_tile/payment_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(
      name: 'ABA',
      image: YImage.aba,
    );
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(YSizes.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YSectionHeading(
                title: 'Select Payment Method',
                showActionButton: false,
              ),
              const SizedBox(height: YSizes.spaceBtwSections),
              YPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'ABA banks',
                  image: YImage.aba,
                ),
              ),
              const SizedBox(height: YSizes.spaceBtwItems / 2),
              YPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'Acleda banks',
                  image: YImage.acleda,
                ),
              ),
              const SizedBox(height: YSizes.spaceBtwItems / 2),
              YPaymentTile(
                paymentMethod: PaymentMethodModel(
                  name: 'KHQR',
                  image: YImage.khqr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

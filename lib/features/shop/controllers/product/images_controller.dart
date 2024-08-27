import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variable
  RxString selectedProductImage = ''.obs;

  /// -- Get All Images from product and Variations
  List<String> getAllProductImage(ProductModel product) {
    // Use Set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    // Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    // Get all images from the Product Model if not null.
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from the Product Variations if not null.
    if (product.productVariations != null || product.productVariations!.isEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// -- Show Image Popup
  /* void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
        () => Dialog.fullScreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 2, horizontal: TSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Close')),
                ),
              ),
            ],
          ),
        ),
      barrierDismissible: false,
    );
  } */

  void showEnlargedImage(String image) {
    Get.dialog(
      Scaffold(
        // backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light, // Set the background color to black for full-screen effect
        backgroundColor: TColors.light, // Set the background color to black for full-screen effect
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.defaultSpace * 2,
                horizontal: TSizes.defaultSpace,
              ),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close', style: TextStyle(color: TColors.grey)),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false, // Prevent closing by tapping outside the dialog
    );
  }
}
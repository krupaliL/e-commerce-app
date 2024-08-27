import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/t_circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  Center(
                    child: TRoundedImage(
                      // padding: EdgeInsets.only(top: TSizes.xl + 10),
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 10,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                    ),
                  ),

                  /// -- Favourite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              // Only reason to use the [SizedBox] here is to make Column full Width
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: product.title, smallSize: true),
                    const SizedBox(height: 4),
                    TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                  ],
                ),
              ),
            ),

            // Use Spacer() to utilize all the space to set the price and the cart button at the bottom.
            // This usually happens when Product title is in single line or 2 lines (Max)
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, Show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                /// Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius)
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
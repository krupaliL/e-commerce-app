import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favorites_controller.dart';
import '../../icons/t_circular_icon.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    return Obx(
        () => TCircularIcon(
          icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
          color: controller.isFavorite(productId) ? Colors.red : null,
          onPressed: () => controller.toggleFavoriteProduct(productId),
        ),
    );
  }
}

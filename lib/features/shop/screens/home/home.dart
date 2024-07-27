import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [

                  /// Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Searchbar
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [

                        /// -- Heading
                        TSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: TColors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// -- Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ],),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Heading
                  TSectionHeading(title: 'Popular Products', onPressed: (){}),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Popular Products
                  TGridLayout(itemCount: 2, itemBuilder: (_, index) => const TProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

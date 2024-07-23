import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
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
                        TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: TColors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// -- Categories
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
                                child: Column(
                                  children: [
                                    /// Circular Icon
                                    Container(
                                      width: 56,
                                      height: 56,
                                      padding: const EdgeInsets.all(TSizes.sm),
                                      decoration: BoxDecoration(
                                        color: TColors.white,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: const Center(
                                        child: Image(image: AssetImage(TImages.shoeIcon), fit: BoxFit.cover, color: TColors.dark),
                                      ),
                                    ),

                                    /// Text
                                    SizedBox(height: TSizes.spaceBtwItems / 2),
                                    SizedBox(
                                      width: 55,
                                      child: Text(
                                        'S',
                                        style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

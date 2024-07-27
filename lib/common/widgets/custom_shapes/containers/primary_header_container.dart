import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'rounded_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: SizedBox(
        height: 400,
        child: Container(
          color: TColors.primary,
          // padding: const EdgeInsets.only(bottom: 0),

          /// -- [size.isFinite': is not true.in stack] error occurred
          child: Stack(
            children: [
              /// -- Background Custom Shapes
              Positioned(
                  top: -150,
                  right: -250,
                  child: TRoundedContainer(
                    width: 400,
                    height: 400,
                    radius: 400,
                    backgroundColor: TColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 100,
                  right: -300,
                  child: TRoundedContainer(
                      width: 400,
                      height: 400,
                      radius: 400,
                      backgroundColor: TColors.textWhite.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

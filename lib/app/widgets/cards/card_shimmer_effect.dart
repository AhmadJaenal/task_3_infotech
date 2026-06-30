import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final double marginHorizontal;
  final double marginVertical;
  final Color baseColor;
  final Color highlightColor;
  const CardShimmerEffect({
    super.key,
    this.width = double.infinity,
    this.height = 60,
    this.marginHorizontal = 24,
    this.marginVertical = 8,
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal,
          vertical: marginVertical,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

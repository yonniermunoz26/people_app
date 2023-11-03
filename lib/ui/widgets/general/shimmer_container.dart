part of '../widgets.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer.linear({
    super.key,
    required this.width,
    required this.height,
  }) : borderRadius = 0;

  const ShimmerContainer.circular({
    super.key,
    required double diameter,
  })  : borderRadius = diameter,
        width = diameter,
        height = diameter;

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

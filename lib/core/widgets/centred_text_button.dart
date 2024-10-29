import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class CenteredTextButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color color;
  final double? height;
  final double? width;
  final double? topRightradius;
  final double? bottomLeftradius;
  final double? bottomRightradius;
  final double? topLeftradius;

  const CenteredTextButton._internal(
      {super.key,
      required this.label,
      required this.onTap,
      required this.color,
      this.height,
      this.topLeftradius,
      this.bottomLeftradius,
      this.topRightradius,
      this.bottomRightradius,
      this.width});

  factory CenteredTextButton.primary(
      {Key? key,
      required String label,
      required Function() onTap,
      required BuildContext context,
      double? height,
      double? width,
      double? topRightradius,
      double? bottomLeftradius,
      double? bottomRightradius,
      double? topLeftradius}) {
    return CenteredTextButton._internal(
      key: key,
      label: label,
      onTap: onTap,
      color: AppColorsTheme.dark().button,
      height: height ?? 50,
      width: width ?? 300,
      topLeftradius: topLeftradius ?? 10,
      topRightradius: topRightradius ?? 10,
      bottomLeftradius: bottomLeftradius ?? 10,
      bottomRightradius: bottomRightradius ?? 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftradius ?? 10),
              topRight: Radius.circular(topRightradius ?? 10),
              bottomLeft: Radius.circular(bottomLeftradius ?? 10),
              bottomRight: Radius.circular(bottomRightradius ?? 10),
            )),
        child: Center(
          child: Text(
            label,
            style:
                AppTypography.main().defaultText.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

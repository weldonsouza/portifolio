import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/utils.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? labelText;
  final Color color;
  final Color colorText;
  final Color colorButton;
  final Function()? onTap;
  final double? width;
  final double? height;
  final double elevation;
  final double borderRadius;
  final double textSize;
  final double paddingButton;
  final double paddingButtonLeft;
  final double paddingButtonRight;
  final FontWeight fontWeight;
  final IconData? iconData;

  const CustomElevatedButton({
    Key? key,
    this.labelText,
    this.color = Constants.blackColor,
    this.colorText = Constants.whiteColor,
    this.colorButton = Constants.blackColor,
    this.onTap,
    this.width,
    this.height = 40,
    this.elevation = 0,
    this.borderRadius = 12,
    this.textSize = 18,
    this.paddingButton = 5,
    this.paddingButtonLeft = 16,
    this.paddingButtonRight = 16,
    this.fontWeight = FontWeight.w500,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingButtonLeft, right: paddingButtonRight),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (Set<MaterialState> states) {
              return EdgeInsets.all(paddingButton);
            },
          ),
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return color; // Disabled color
            }
            return color; // Regular color
          }),
          side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.pressed)
                ? Colors.grey.shade100
                : colorButton;
            return BorderSide(color: color, width: 1);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onTap,
        child: Container(
          width: width ?? Utils.mediaQuery(context, 1),
          height: height ?? 44,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                labelText!,
                style: GoogleFonts.raleway(
                  color: colorText,
                  fontSize: textSize,
                  fontWeight: fontWeight,
                ),
              ),
              iconData == null
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(
                        iconData,
                        color: colorText,
                        size: textSize,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

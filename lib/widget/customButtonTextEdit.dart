import 'package:flutter/material.dart';
import 'custom_inkwell_btn.dart';
import 'custom_text.dart';

class CustomButtonTextEdit extends StatelessWidget {
  CustomButtonTextEdit(
      {this.onPressed,
      this.btnHeight,
      this.btnWidth,
      this.btnColor,
      this.btnBorderWidth,
      this.btnBorderColor,
      this.btnRadius,
      this.title,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.titleText,
      Key? key})
      : super(key: key);
  Function? onPressed;
  final titleText;
  double? btnHeight;
  double? btnWidth;
  Color? btnColor;
  double? btnBorderWidth;
  Color? btnBorderColor;
  double? btnRadius;
  String? title;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onPressed,
      child: Container(
        width: btnWidth ?? double.infinity,
        height: btnHeight ?? 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: btnColor,
            border: Border.all(
                width: btnBorderWidth == null ? 0 : btnBorderWidth!,
                color: btnBorderColor == null
                    ? Colors.transparent
                    : btnBorderColor!),
            borderRadius:
                BorderRadius.circular(btnRadius == null ? 0 : btnRadius!)),
        child: titleText,
      ),
    );
  }
}

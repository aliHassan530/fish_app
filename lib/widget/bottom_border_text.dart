import 'package:app/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/custom_text.dart';

class BottomBorderText extends StatelessWidget {
  BottomBorderText({
    this.txt,
    this.borderColor,
  });

  final txt;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: borderColor ?? kSecoundryColor,
              ),
            ),
          ),
          child: CustomText(
            title: txt,
            color: kBlackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

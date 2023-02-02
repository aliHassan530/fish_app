import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextImageButton extends StatelessWidget {
  CustomTextImageButton({
    this.txt,
    this.onTap,
  });

  final txt;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onTap!();
      },
      child: Container(
        height: 42,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: kSecoundryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: txt,
              // title: "Lets Go",
              fontSize: 16,
              color: kMainColor,
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/arrow 1.png',
              height: 19.38.h,
            ),
          ],
        ),
      ),
    );
  }
}

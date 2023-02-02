import 'package:app/model/comment_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/bottom_border_text.dart';
import '../../../widget/custom_text.dart';

class LogAnotherDateCardWidget extends StatelessWidget {
  LogAnotherDateCardWidget({
    this.title,
    this.date,
  });

  final title;
  final date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 13),
        child: Column(
          children: [
            CustomText(
              title: date,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
              fontSize: 14,
              maxLines: 1,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: title,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              fontSize: 11,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilites/constants.dart';
import '../../../widget/custom_text.dart';

class MySubmissionTabWidget extends StatelessWidget {
  MySubmissionTabWidget({
    this.title,
    this.subtitle,
  });

  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.18,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
        child: Column(
          children: [
            CustomText(
              title: title,
              fontWeight: FontWeight.w700,
              color: kSecoundryColor,
              fontSize: 16,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: subtitle,
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

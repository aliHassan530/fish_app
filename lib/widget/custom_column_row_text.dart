import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColumnRowText extends StatelessWidget {
  CustomColumnRowText({
    this.title,
    this.rooke,
    this.rookeFw,
    this.elite,
    this.eliteFw,
    this.master,
    this.masterFw,
  });

  String? title;
  final rooke;
  FontWeight? rookeFw;
  final elite;
  FontWeight? eliteFw;
  final master;
  FontWeight? masterFw;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.36,
            child: CustomText(
              title: title,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            child: CustomText(
              title: rooke,
              fontSize: 12,
              color: kGreyDarkColor,
              lineHeight: 1.5,
              textAlign: TextAlign.center,
              fontWeight: rookeFw,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            child: CustomText(
              title: elite,
              textAlign: TextAlign.center,
              fontWeight: eliteFw,
              color: kSecoundryColor,
              lineHeight: 1.4,
              fontSize: 12,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            child: CustomText(
              title: master,
              fontSize: 12,
              lineHeight: 1.5,
              color: kRedDarkColor,
              textAlign: TextAlign.center,
              fontWeight: masterFw,
            ),
          ),
        ],
      ),
    );
  }
}

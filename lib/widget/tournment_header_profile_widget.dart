import 'package:app/model/home_header_model.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';

class TournamentHeaderProfileWidget extends StatelessWidget {
  final HomeHeaderModel? homeWidget;

  const TournamentHeaderProfileWidget({Key? key, this.homeWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                homeWidget!.image,
                // "assets/Rectangle 2597.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomText(
            title: homeWidget!.title,
            // "Emily Grimes",
            fontSize: 12,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: kBlackColor,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomText(
            title: homeWidget!.subtitle,
            // "2 wins this month",
            textAlign: TextAlign.center,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: kGreyDarkColor,
          ),
        ],
      ),
    );
  }
}

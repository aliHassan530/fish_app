import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/activity_tab_overview_card_model.dart';

class ActivityCardWidget extends StatelessWidget {
  final ActivityTabOverViewCardModel? activeTournaments;

  const ActivityCardWidget({Key? key, this.activeTournaments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        child: Column(
          children: [
            CustomText(
              title: activeTournaments!.count,
              fontWeight: FontWeight.w600,
              color: kSecoundryColor,
              fontSize: 24,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: activeTournaments!.title,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}

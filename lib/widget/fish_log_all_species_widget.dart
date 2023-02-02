import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/recent_log_model.dart';
import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';

class FishLogAllSpeciesWidget extends StatelessWidget {
  final RecentLogModel? recent;

  const FishLogAllSpeciesWidget({Key? key, this.recent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 120.w,
        height: 100.h,
        child: Column(
          children: [
            Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Image.asset(
                    recent!.image,
                    height: 70,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: recent!.inchesNumber,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: kSecoundryColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomText(
              title: recent!.title,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomText(
              title: recent!.data,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kSecoundryColor,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

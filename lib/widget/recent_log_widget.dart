import 'package:app/model/recent_log_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentLogWidget extends StatelessWidget {
  final RecentLogModel? recent;

  const RecentLogWidget({Key? key, this.recent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 120.w,
        height: 100.h,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Image.asset(
                recent!.image,
                height: 70,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            CustomText(
              title: recent!.inchesNumber,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: kSecoundryColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(
              title: recent!.title,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: recent!.data,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kSecoundryColor,
              maxLines: 1,
            ),
            // Container(
            //   height: 70.h,
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     physics: ClampingScrollPhysics(),
            //     shrinkWrap: true,
            //     children: [
            //       MySubmissionTabWidget(
            //         title: "3rd",
            //         subtitle: "Place",
            //       ),
            //       MySubmissionTabWidget(
            //         title: "4/10",
            //         subtitle: "Live Well",
            //       ),
            //       MySubmissionTabWidget(
            //         title: "41.2",
            //         subtitle: "Length",
            //       ),
            //       MySubmissionTabWidget(
            //         title: "81",
            //         subtitle: "XP Earned",
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

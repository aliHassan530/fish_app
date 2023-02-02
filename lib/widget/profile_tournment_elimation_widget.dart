import 'package:app/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/profile_tournment_elimination_model.dart';
import '../../widget/custom_text.dart';

class ProfileTournmentElimationTab extends StatelessWidget {
  final ProfileTournmnetEliminationModel? profile;
  final ind;

  ProfileTournmentElimationTab({Key? key, this.profile, this.ind})
      : super(key: key);

  @override
  Color selectedColour(int pos) {
    Color? c;

    if (pos % 3 == 0) c = Color(0xFF9B3030);
    if (pos % 3 == 1) c = Color(0xFFD58957);
    if (pos % 3 == 2) c = Color(0xFFF0F366);
    return c!;
  }

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              border: Border.all(color: kSecoundryColor.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.width * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                profile!.img,
                fit: BoxFit.cover,
                height: 100.h,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  title: profile!.title,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/clock-10.png",
                      height: 15.h,
                      color: kGreyDarkColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                      title: profile!.time,
                      fontSize: 12,
                      maxLines: 1,
                      fontWeight: FontWeight.w500,
                      color: kBlackColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  title: profile!.time,
                  fontSize: 12,
                  color: kGreyDarkColor,
                  fontWeight: FontWeight.w700,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: FAProgressBar(
                    currentValue: 30,
                    size: 10.h,
                    border: Border.all(color: kSecoundryColor.withOpacity(0.5)),
                    animatedDuration: Duration(seconds: 3),
                    progressColor: selectedColour(ind),
                    backgroundColor: kMainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/activity_tab_achievement_widget.dart';

class ProfileAcheivements extends StatefulWidget {
  const ProfileAcheivements({Key? key}) : super(key: key);

  @override
  State<ProfileAcheivements> createState() => _ProfileAcheivementsState();
}

class _ProfileAcheivementsState extends State<ProfileAcheivements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            title: "Trophy Case",
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: kBlackColor,
          ),
          SizedBox(
            height: 8.h,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActvityTabAchievementWidget(
                    image: "assets/image 7 (4).png",
                    title: "South East\nSalty Slam\nWeek 52 2022",
                  ),
                  ActvityTabAchievementWidget(
                    image: "assets/image 7 (4).png",
                    title: "Smallmouth Bass\nWeekly Bags\nNovember 2022",
                  ),
                  ActvityTabAchievementWidget(
                    image: "assets/image 7 (4).png",
                    title: "Freshwater\nAngler Elimination\nOctober 2022",
                  ),
                ],
              ),
            ),
          ),

// 2nd
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            title: "Elimination Tournaments",
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: kBlackColor,
          ),
          SizedBox(
            height: 8.h,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActvityTabAchievementWidget(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: "assets/image 7 (4).png",
                    title: "First\nElimination\nTournament",
                  ),
                  ActvityTabAchievementWidget(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: "assets/image 7 (4).png",
                    title: "First\nElimination\nTournament",
                  ),
                  ActvityTabAchievementWidget(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: "assets/image 7 (4).png",
                    title: "First\nElimination\nTournament",
                  ),
                  ActvityTabAchievementWidget(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: "assets/image 7 (4).png",
                    title: "First\nElimination\nTournament",
                  ),
                ],
              ),
            ),
          ),

          // 3rd
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            title: "Weekly Bags Tournaments ",
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: kBlackColor,
          ),
          SizedBox(
            height: 8.h,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActvityTabAchievementWidget(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: "assets/image 7 (4).png",
                    title: "First\nElimination\nTournament",
                  ),
                  ActvityTabAchievementWidget(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: "assets/image 7 (4).png",
                    title: "First\nElimination\nTournament",
                  ),
                  ActvityTabAchievementWidget(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: "assets/image 7 (4).png",
                    title: "First\nElimination\nTournament",
                  ),
                  ActvityTabAchievementWidget(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: "assets/image 7 (4).png",
                    title: "First\nElimination\nTournament",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:app/model/recent_log_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/activity_tab_overview_card_model.dart';
import '../../widget/activity_card_widget.dart';
import '../../widget/activity_tab_achievement_widget.dart';
import '../../widget/recent_log_widget.dart';

class ActivityTab extends StatefulWidget {
  const ActivityTab({Key? key}) : super(key: key);

  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: CustomText(
                title: "Overview",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              height: 90.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15),
                itemCount: activeTabList.length,
                itemBuilder: (context, index) {
                  return ActivityCardWidget(
                    activeTournaments: activeTab[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: CustomText(
                title: "Recent Logs",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              height: 170.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15),
                itemCount: recentLogList.length,
                itemBuilder: (context, index) {
                  return RecentLogWidget(
                    recent: recentLog[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: CustomText(
                title: "Recent Acheivements",
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
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
                      title: "South East\nSalty Slam\nWeek 52 2022",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




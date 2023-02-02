import 'package:app/screens/profile/profile_public.dart';
import 'package:app/utilites/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/current_standling_model.dart';
import '../../../model/last_week_tab_model.dart';
import '../../../utilites/constants.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/elimination_current_standing_widget.dart';

class CurrentStandingTab extends StatelessWidget {
  const CurrentStandingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: lastWeekTabList.length,
          itemBuilder: (context, index) {
            return EliminationCurrentStandingsTabWidget(
              lastWeek: currentStandling[index],
              // homeWidget: headerProfile[index],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 75.h,
        color: Colors.transparent,
        child: Column(
          children: [
            CustomButton(
              btnHeight: 54.h,
              btnRadius: 100,
              onPressed: () {},
              title: "Log Fish",
              textColor: kMainColor,
              btnColor: kSecoundryColor,
            ),
          ],
        ),
      ),
    );
  }
}


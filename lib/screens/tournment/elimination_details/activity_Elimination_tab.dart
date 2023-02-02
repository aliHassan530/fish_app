import 'package:app/model/activity_elimimnation_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/activity_elimination_tab_widget.dart';
import '../../../widget/custom_button.dart';

class ActivityEliminationTab extends StatefulWidget {
  const ActivityEliminationTab({Key? key}) : super(key: key);

  @override
  State<ActivityEliminationTab> createState() => _ActivityEliminationTabState();
}

class _ActivityEliminationTabState extends State<ActivityEliminationTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: activeEliminationList.length,
          itemBuilder: (context, index) {
            return ActivityEliminationWidget(
              active: activeElimination[index],
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


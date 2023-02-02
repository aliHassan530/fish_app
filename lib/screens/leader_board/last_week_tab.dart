import 'package:app/model/last_week_tab_model.dart';
import 'package:app/screens/profile/profile_public.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/leader_board_widget.dart';

class LastWeek extends StatefulWidget {
  const LastWeek({Key? key}) : super(key: key);

  @override
  State<LastWeek> createState() => _LastWeekState();
}

class _LastWeekState extends State<LastWeek> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              CustomText(
                title: "Top 100",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                maxLines: 1,
                color: kBlackColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: CustomText(
                  title: "21 Nov - 28 Nov 2022",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kGreyDarkColor,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: lastWeekTabList.length,
            itemBuilder: (context, index) {
              return LeaderBoardListTile(
                lastWeek: lastWeekTab[index],
                // homeWidget: headerProfile[index],
              );
            },
          ),
        ],
      ),
    );
  }
}


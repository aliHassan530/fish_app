import 'package:app/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/profile_tournment_elimination_model.dart';
import '../../widget/custom_text.dart';
import '../../widget/profile_tournment_elimation_widget.dart';

class ElimationTournmentTab extends StatefulWidget {
  const ElimationTournmentTab({Key? key}) : super(key: key);

  @override
  State<ElimationTournmentTab> createState() => _ElimationTournmentTabState();
}

class _ElimationTournmentTabState extends State<ElimationTournmentTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          SizedBox(
            height: 16.h,
          ),
          CustomText(
            title: "Active Tournaments",
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: profileEliminationList.length,
              itemBuilder: (context, index) {
                return ProfileTournmentElimationTab(
                  profile: profileElimination[index],
                  ind: index,
                  // homeWidget: headerProfile[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


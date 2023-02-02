import 'package:flutter/material.dart';

import '../../../model/home_widget_model.dart';
import '../../../widget/weekly_bags_widget.dart';

class WeeklyBagsTab extends StatefulWidget {
  const WeeklyBagsTab({Key? key}) : super(key: key);

  @override
  State<WeeklyBagsTab> createState() => _WeeklyBagsTabState();
}

class _WeeklyBagsTabState extends State<WeeklyBagsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        // padding: EdgeInsets.only(left: 15),
        itemCount: homeList.length,
        itemBuilder: (context, index) {
          return WeeklyBagsWidget(
            home: homeList[index],
            // homeWidget: headerProfile[index],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../model/home_widget_model.dart';
import '../../../widget/slam_widget.dart';
import '../../../widget/tournment_widget.dart';

class Slamtab extends StatefulWidget {
  const Slamtab({Key? key}) : super(key: key);

  @override
  State<Slamtab> createState() => _SlamtabState();
}

class _SlamtabState extends State<Slamtab> {
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
          return SlamWidget(
            home: homeList[index],
            // homeWidget: headerProfile[index],
          );
        },
      ),
    );
  }
}

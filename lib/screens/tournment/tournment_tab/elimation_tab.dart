import 'package:flutter/material.dart';

import '../../../model/home_widget_model.dart';
import '../../../widget/elimination_tournmnet_widget.dart';
import '../../../widget/tournment_widget.dart';

class ElimationTab extends StatefulWidget {
  const ElimationTab({Key? key}) : super(key: key);

  @override
  State<ElimationTab> createState() => _ElimationTabState();
}

class _ElimationTabState extends State<ElimationTab> {
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
          return EliminationTournamentWidget(
            home: homeList[index],
            // homeWidget: headerProfile[index],
          );
        },
      ),
    );
  }
}

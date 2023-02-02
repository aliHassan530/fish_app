import 'package:flutter/material.dart';

import '../../../model/home_widget_model.dart';
import '../../../widget/series_widget.dart';
import '../../../widget/tournment_widget.dart';

class SeriesTab extends StatefulWidget {
  const SeriesTab({Key? key}) : super(key: key);

  @override
  State<SeriesTab> createState() => _SeriesTabState();
}

class _SeriesTabState extends State<SeriesTab> {
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
          return SeriesWidget(
            home: homeList[index],
            // homeWidget: headerProfile[index],
          );
        },
      ),
    );
  }
}

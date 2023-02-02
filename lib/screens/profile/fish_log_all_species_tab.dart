import 'package:flutter/material.dart';

import '../../model/recent_log_model.dart';
import '../../widget/fish_log_all_species_widget.dart';

class FishLogAllSpeciesTab extends StatefulWidget {
  const FishLogAllSpeciesTab({Key? key}) : super(key: key);

  @override
  State<FishLogAllSpeciesTab> createState() => _FishLogAllSpeciesTabState();
}

class _FishLogAllSpeciesTabState extends State<FishLogAllSpeciesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 7,
          childAspectRatio: 0.72,
        ),
        itemCount: recentLogList.length,
        itemBuilder: (context, index) {
          return FishLogAllSpeciesWidget(
            recent: recentLog[index],
          );
        },
      ),
    );
  }
}


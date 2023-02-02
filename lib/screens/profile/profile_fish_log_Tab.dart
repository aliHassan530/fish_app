import 'package:app/screens/profile/profile_tournments.dart';
import 'package:app/utilites/constants.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

import '../../widget/tab_text_widget.dart';
import 'fish_log_all_species_tab.dart';

class ProfileFishLogTab extends StatefulWidget {
  const ProfileFishLogTab({Key? key}) : super(key: key);

  @override
  State<ProfileFishLogTab> createState() => _ProfileFishLogTabState();
}

class _ProfileFishLogTabState extends State<ProfileFishLogTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kMainColor,
          bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: kMainColor,
                // border: Border.all(color: , width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: kSecoundryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                indicator: BubbleTabIndicator(
                    indicatorHeight: 40,
                    indicatorRadius: 100,
                    indicatorColor: kSecoundryColor),
                tabs: [
                  TabText(
                    title: "All Species (12)",
                  ),
                  TabText(
                    title: "Largemouth Bass (4)",
                  ),
                  TabText(
                    title: "Peacock Bass (2)",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              FishLogAllSpeciesTab(),
              FishLogAllSpeciesTab(),
              FishLogAllSpeciesTab(),
            ],
          ),
        ),
      ),
    );
  }
}

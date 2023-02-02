import 'package:app/screens/profile/elimation_tab.dart';
import 'package:app/utilites/constants.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_text.dart';
import '../../widget/tab_text_widget.dart';

class ProfileTournment extends StatefulWidget {
  const ProfileTournment({Key? key}) : super(key: key);

  @override
  State<ProfileTournment> createState() => _ProfileTournmentState();
}

class _ProfileTournmentState extends State<ProfileTournment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                    title: "All Types (37)",
                  ),
                  TabText(
                    title: "Elimination (14)",
                  ),
                  TabText(
                    title: "Weekly Bags (21)",
                  ),
                  TabText(
                    title: "Slam (13)",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              ElimationTournmentTab(),
              ElimationTournmentTab(),
              ElimationTournmentTab(),
              ElimationTournmentTab(),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import 'last_month_tab.dart';
import 'last_week_tab.dart';

class LeaderBoardWeekly extends StatefulWidget {
  const LeaderBoardWeekly({Key? key}) : super(key: key);

  @override
  State<LeaderBoardWeekly> createState() => _LeaderBoardWeeklyState();
}

class _LeaderBoardWeeklyState extends State<LeaderBoardWeekly> {
  bool active = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kMainColor,
            elevation: 0,
            title: CustomText(
              title: "LeaderBoardWeekly",
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: kBlackColor,
            ),
            actions: [
              Container(
                width: 120,
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              active = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: active ? kSecoundryColor : kMainColor,
                            ))),
                            child: CustomText(
                              title: "Weekly",
                              fontWeight:
                                  active ? FontWeight.w700 : FontWeight.w400,
                              fontSize: 13,
                              color: active ? kSecoundryColor : kGreyDarkColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/Rectangle 2603.png",
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              active = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: active ? kMainColor : kSecoundryColor,
                                ),
                              ),
                            ),
                            child: CustomText(
                              title: "Monthly",
                              fontWeight:
                                  active ? FontWeight.w400 : FontWeight.w700,
                              fontSize: 13,
                              color: active ? kGreyDarkColor : kSecoundryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(0, 50),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                height: 45,
                decoration: BoxDecoration(
                  // border: Border.all(color: , width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: kMainColor,
                  child: TabBar(
                    unselectedLabelColor: kSecoundryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                    indicator: BubbleTabIndicator(
                        indicatorHeight: 40,
                        indicatorRadius: 100,
                        indicatorColor: kSecoundryColor),
                    tabs: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: kSecoundryColor.withOpacity(0.2)),
                        ),
                        child: Center(
                          child: CustomText(
                            title: active ? "Last Week" : "Last Month",
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: kSecoundryColor.withOpacity(0.2)),
                        ),
                        child: Center(
                          child: CustomText(
                            title: active ? "This Week" : "This Month",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Container(
              child: active
                  ? TabBarView(
                      children: [
                        LastWeek(),
                        LastWeek(),
                      ],
                    )
                  : TabBarView(
                      children: [
                        LastMonthTab(),
                        LastMonthTab(),
                      ],
                    ))),
    );
  }
}

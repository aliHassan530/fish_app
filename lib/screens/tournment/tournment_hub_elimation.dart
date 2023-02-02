import 'package:app/screens/tournment/tournment_tab/elimation_tab.dart';
import 'package:app/screens/tournment/tournment_tab/series_tab.dart';
import 'package:app/screens/tournment/tournment_tab/slam_tab.dart';
import 'package:app/screens/tournment/tournment_tab/weekly_bags_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/home_header_model.dart';
import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import '../../widget/home_header_profile_widget.dart';
import '../../widget/tournment_header_profile_widget.dart';

class TournmentHubelimation extends StatefulWidget {
  const TournmentHubelimation({Key? key}) : super(key: key);

  @override
  State<TournmentHubelimation> createState() => _TournmentHubelimationState();
}

class _TournmentHubelimationState extends State<TournmentHubelimation> {
  bool active = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0,
          title: CustomText(
            title: "Tournaments",
            fontWeight: FontWeight.w700,
            fontSize: 24,
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
                            title: "Active",
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
                            title: "Coming Up",
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
        ),
        body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: kMainColor,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  expandedHeight: 170.0,
                  collapsedHeight: 60,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        Container(
                          height: 150.h,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: headerProfile.length,
                            itemBuilder: (context, index) {
                              return TournamentHeaderProfileWidget(
                                homeWidget: headerProfile[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size(0, 0),
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 30,
                            child: TabBar(
                              labelPadding: EdgeInsets.zero,
                              indicatorWeight: 2,
                              isScrollable: true,
                              labelColor: kSecoundryColor,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: kSecoundryColor),
                              unselectedLabelStyle:
                                  TextStyle(fontWeight: FontWeight.w400),
                              unselectedLabelColor: kGreyDarkColor,
                              indicatorColor: kSecoundryColor,
                              indicatorPadding:
                                  const EdgeInsets.only(right: 20),
                              padding: EdgeInsets.zero,
                              tabs: [
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Elimination",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Weekly Bags",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Slam",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Series",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              child: TabBarView(
                children: [
                  ElimationTab(),
                  WeeklyBagsTab(),
                  Slamtab(),
                  SeriesTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

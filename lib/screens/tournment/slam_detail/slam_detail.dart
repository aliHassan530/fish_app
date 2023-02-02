import 'package:animations/animations.dart';
import 'package:app/screens/tournment/slam_detail/slam_activityTab.dart';
import 'package:app/screens/tournment/slam_detail/slam_current_standings.dart';
import 'package:app/screens/tournment/slam_detail/slam_detail_tab.dart';
import 'package:app/screens/tournment/slam_detail/slam_my_submision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilites/constants.dart';
import '../../../widget/custom_text.dart';
import '../../alert_box/invite_friends.dart';

class SlamDetailScreen extends StatefulWidget {
  const SlamDetailScreen({Key? key}) : super(key: key);

  @override
  State<SlamDetailScreen> createState() => _SlamDetailScreenState();
}

class _SlamDetailScreenState extends State<SlamDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 15),
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/Stroke 1.png",
                    height: 12.25,
                    color: kSecoundryColor,
                  ),
                  CustomText(
                    title: "Back",
                    fontSize: 14,
                    color: kSecoundryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
          title: CustomText(
            title: "Southeast Salty Slam",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: kBlackColor,
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showModal(
                      context: context,
                      configuration: FadeScaleTransitionConfiguration(
                          transitionDuration: Duration(milliseconds: 800)),
                      builder: (BuildContext context) {
                        return InviteFriendsAlertBox();
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    child: CustomText(
                      title: "Invite",
                      color: kTextRedColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )
          ],
          centerTitle: true,
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
                  expandedHeight: 300.0,
                  collapsedHeight: 60,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/Rectangle 2607 (3).png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          CustomText(
                            title:
                                "3 days until next cut line (Sunday 7 p.m. CST Nov 27, 2022)",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            child: FAProgressBar(
                              currentValue: 30,
                              size: 7.h,
                              animatedDuration: Duration(seconds: 3),
                              progressColor: kSecoundryColor,
                              backgroundColor: kGreyLightColor.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
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
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w700),
                              unselectedLabelStyle:
                                  TextStyle(fontWeight: FontWeight.w400),
                              isScrollable: true,
                              labelColor: kSecoundryColor,
                              unselectedLabelColor: kGreyDarkColor,
                              indicatorColor: kSecoundryColor,
                              indicatorPadding: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.zero,
                              tabs: [
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Details",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "My Submissions",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Current Standings",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Activity",
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
                  SlamDetailTabScreen(),
                  SlamMySubmissionTab(),
                  SlamCurrentStandingsTab(),
                  SlamActivityTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

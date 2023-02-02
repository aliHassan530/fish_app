import 'package:app/screens/chat_screen/chat_sceen.dart';
import 'package:app/screens/profile/profile_acheivements.dart';
import 'package:app/screens/profile/profile_fish_log_Tab.dart';
import 'package:app/screens/profile/profile_tournments.dart';
import 'package:app/screens/profile_setting_menu/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widget/custom_text.dart';
import 'activity_tab.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              Helper.toScreen(context, SettingScreen());
            },
            child: Icon(
              Icons.settings,
              color: kBlackColor,
            ),
          ),
          title: CustomText(
            title: "Craig Davis",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: kBlackColor,
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Helper.toScreen(context, ChatScreen());
                  //   },
                  //   child: Image.asset(
                  //     "assets/Vector (54).png",
                  //     height: 22.h,
                  //   ),
                  // ),
                  Image.asset(
                    "assets/Vector (55).png",
                    height: 22.h,
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
                  expandedHeight: 280.0,
                  collapsedHeight: 60,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/Rectangle 2597 (8).png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        CustomText(
                          title: "ELITE LEVEL 3",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kGreyDarkColor,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: FAProgressBar(
                            currentValue: 30,
                            size: 7.h,
                            animatedDuration: Duration(seconds: 3),
                            progressColor: kSecoundryColor,
                            backgroundColor: kGreyLightColor,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomText(
                          title: "241 XP until Elite Level 4",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kGreyDarkColor,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: kSecoundryColor.withOpacity(0.2)),
                              ),
                              child: Center(
                                child: CustomText(
                                  title: "0 Followers",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Container(
                              height: 40,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: kSecoundryColor.withOpacity(0.2)),
                              ),
                              child: Center(
                                child: CustomText(
                                  title: "0 Following",
                                ),
                              ),
                            ),
                          ],
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
                                    "Activity",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Tournaments",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Fish Log",
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Acheivements",
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
                  ActivityTab(),
                  ProfileTournment(),
                  ProfileFishLogTab(),
                  ProfileAcheivements(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

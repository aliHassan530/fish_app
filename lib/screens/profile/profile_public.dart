import 'package:app/screens/profile/profile_acheivements.dart';
import 'package:app/screens/profile/profile_fish_log_Tab.dart';
import 'package:app/screens/profile/profile_tournments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/auth_services.dart';
import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import '../../widget/rounded_text_widget.dart';
import 'activity_tab.dart';

class ProfilePublicScreen extends StatefulWidget {
  ProfilePublicScreen({
    this.nodeId,
  });

  final nodeId;

  @override
  State<ProfilePublicScreen> createState() => _ProfilePublicScreenState();
}

class _ProfilePublicScreenState extends State<ProfilePublicScreen> {
  // bool fellow = false;
  // var data;
  // void init() async {
  //   if (widget.nodeId !=null) {
  //      data = await FirebaseFirestore.instance
  //         .collection("user")
  //         .doc(widget.nodeId)
  //         .get();
  //   }
  // }
  void initState() {
    super.initState();
    checkInit();
  }

  Map<String, dynamic> otherUserDetails = {};

  checkInit() async {
    print(widget.nodeId);
    otherUserDetails=  await AuthServices.getUserDetails(widget.nodeId);
    setState(() {
    });
  }
  bool fellow=false;
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
                    )
                  ],
                ),
              ),
            ),
            title: CustomText(
              title: "${otherUserDetails["firstN"].toString()} ${otherUserDetails["lastN"].toString()}",
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: kBlackColor,
            ),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    fellow = !fellow;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 35,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kSecoundryColor,
                          ),
                          borderRadius: BorderRadius.circular(100),
                          color: fellow ? kMainColor : kSecoundryColor,
                        ),
                        child: Center(
                          child: CustomText(
                            title: "Follow",
                            color: fellow ? kSecoundryColor : kMainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                              child:otherUserDetails["image"]!=null?Image.network(otherUserDetails["image"],fit: BoxFit.cover,): Icon(Icons.person,size: 50,),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          CustomText(
                            title: "ELITE LEVEL 3",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kGreyDarkColor,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.6,
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
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedTextButtonWidget(
                                  title: "${otherUserDetails["followers"]}",
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                RoundedTextButtonWidget(
                                  title: "${otherUserDetails["followings"]}",
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                RoundedTextButtonWidget(
                                  title: "Message",
                                ),
                              ],
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

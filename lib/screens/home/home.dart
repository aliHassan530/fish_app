import 'package:app/model/home_header_model.dart';
import 'package:app/model/home_widget_model.dart';
import 'package:app/widget/custom_text.dart';
import 'package:app/widget/custom_textfield.dart';
import 'package:app/widget/home_header_profile_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/user_model.dart';
import '../../utilites/constants.dart';
import '../../widget/active_tournment_home_widget.dart';
import '../../widget/home_more_widget.dart';
import '../../widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: kGreyColor, width: 2)),
                        child: Image.asset(
                          "assets/LogoCircled@3x 2.png",
                          height: 34.h,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      CustomText(
                        title: "Welcome back, Craig",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    child: CustomTextField(
                      fontSize: 14,
                      fillColor: kGreyLightColor.withOpacity(0.4),
                      hintFontSize: 15,
                      hintTextColor: kGreyDarkColor,
                      hintText: "Tournaments, People, Species...",
                      cursorColor: kGreyDarkColor,
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/microphone.png",
                            height: 15.78,
                          ),
                        ],
                      ),
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/magnifyingglass.png",
                            height: 15.78,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText(
                      title: "Angler Spotlights",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),

                  Container(
                    height: 150.h,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                      // .where("searchIndex",
                      //     arrayContains: searchController.text.toLowerCase())
                          .where("uid", isNotEqualTo: UserModel().uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null &&
                            snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return snapshot.data!.docs.isEmpty
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "No Record",
                                style: const TextStyle(
                                    color: kBlackColor, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                              :  Container(
                            height: 150.h,
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return HomeHeaderProfile(
                                  image: snapshot.data!.docs[index]["image"],
                                  firstN: snapshot.data!.docs[index]["firstN"],
                                  lastN: snapshot.data!.docs[index]["lastN"],
                                  profilePrivacy: snapshot.data!.docs[index]["profilePrivacy"],
                                  notId: snapshot.data!.docs[index]["uid"],
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  // Container(
                  //   height: 150.h,
                  //   child: ListView.builder(
                  //     padding: EdgeInsets.symmetric(horizontal: 15),
                  //     scrollDirection: Axis.horizontal,
                  //     physics: const ClampingScrollPhysics(),
                  //     shrinkWrap: true,
                  //     itemCount: headerProfile.length,
                  //     itemBuilder: (context, index) {
                  //       return HomeHeaderProfile(
                  //         homeWidget: headerProfile[index],
                  //       );
                  //     },
                  //   ),
                  // ),
                  HomeMoreWidget(
                    title: "Happening Now",
                    trailing: "Browse Tournaments",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 295.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 15),
                      itemCount: homeList.length,
                      itemBuilder: (context, index) {
                        return HomeWidget(
                          home: homeList[index],
                          // homeWidget: headerProfile[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  HomeMoreWidget(
                    title: "Your Active Tournaments",
                    trailing: "My Tournaments",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 230.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 15),
                      itemCount: homeList.length,
                      itemBuilder: (context, index) {
                        return ActiveTournamentsHomeWidget(
                          activeTournaments: homeList[index],
                          // homeWidget: headerProfile[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

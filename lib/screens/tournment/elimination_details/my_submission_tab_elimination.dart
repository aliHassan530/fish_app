import 'package:app/screens/tournment/elimination_details/week1and2_tab.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilites/constants.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/my_submissionTab_widget.dart';

class MySubmissionTabElimination extends StatefulWidget {
  const MySubmissionTabElimination({Key? key}) : super(key: key);

  @override
  State<MySubmissionTabElimination> createState() =>
      _MySubmissionTabEliminationState();
}

class _MySubmissionTabEliminationState
    extends State<MySubmissionTabElimination> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kMainColor,
          bottom: PreferredSize(
            preferredSize: Size(0, 70),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 5),
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/Rectangle 2600 (3).png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 70.h,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.75,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          MySubmissionTabWidget(
                            title: "3rd",
                            subtitle: "Place",
                          ),
                          MySubmissionTabWidget(
                            title: "4/10",
                            subtitle: "Live Well",
                          ),
                          MySubmissionTabWidget(
                            title: "41.2",
                            subtitle: "Length",
                          ),
                          MySubmissionTabWidget(
                            title: "81",
                            subtitle: "XP Earned",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kGreyLightColor.withOpacity(0.3)),
                  height: 40,
                  child: TabBar(
                    unselectedLabelColor: kSecoundryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    indicator: BubbleTabIndicator(
                        indicatorHeight: 40,
                        indicatorRadius: 100,
                        indicatorColor: kSecoundryColor),
                    tabs: [
                      CustomText(
                        title: "Week 1 & 2",
                        fontSize: 10,
                        color: kMainColor,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        title: "Week 3",
                        fontSize: 12,
                        maxLines: 1,
                        color: kMainColor,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        title: "Week 4",
                        fontSize: 12,
                        maxLines: 1,
                        color: kMainColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              Week1And2Tab(),
              Week1And2Tab(),
              Week1And2Tab(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 75.h,
          color: Colors.transparent,
          child: Column(
            children: [
              CustomButton(
                btnHeight: 54.h,
                btnRadius: 100,
                onPressed: () {},
                title: "Log Fish",
                textColor: kMainColor,
                btnColor: kSecoundryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:app/screens/tournment/elimination_details/week1and2_tab.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilites/constants.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text.dart';
import 'my_submission_days_tab.dart';

class SeriesSubmissionTab extends StatefulWidget {
  const SeriesSubmissionTab({Key? key}) : super(key: key);

  @override
  State<SeriesSubmissionTab> createState() =>
      _SeriesSubmissionTabState();
}

class _SeriesSubmissionTabState
    extends State<SeriesSubmissionTab> {
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
                      width: MediaQuery.of(context).size.width * 0.75,
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
                        title: "Thursday & Friday",
                        fontSize: 11,
                        maxLines: 1,
                        color: kMainColor,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        title: "Saturday",
                        fontSize: 12,
                        maxLines: 1,
                        color: kMainColor,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        title: "Sunday",
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
              MySubmissionDaysTab(),
              MySubmissionDaysTab(),
              MySubmissionDaysTab(),
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

class MySubmissionTabWidget extends StatelessWidget {
  MySubmissionTabWidget({
    this.title,
    this.subtitle,
  });

  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.18,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
        child: Column(
          children: [
            CustomText(
              title: title,
              fontWeight: FontWeight.w700,
              color: kSecoundryColor,
              fontSize: 16,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: subtitle,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              fontSize: 11,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import 'feature_request_tab.dart';

class SettingContactUs extends StatefulWidget {
  const SettingContactUs({Key? key}) : super(key: key);

  @override
  State<SettingContactUs> createState() => _SettingContactUsState();
}

class _SettingContactUsState extends State<SettingContactUs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
            title: "Contact Us",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: kBlackColor,
          ),
          centerTitle: true,
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: CustomText(
                    title: "Submit",
                    color: kSecoundryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(0, 140),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: kGreyColor, width: 2)),
                          child: Image.asset(
                            "assets/LogoCircled@3x 2.png",
                            height: 60.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
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
                          title: "Feature Request",
                          fontSize: 10,
                          color: kMainColor,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          title: "Question",
                          fontSize: 12,
                          maxLines: 1,
                          color: kMainColor,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          title: "Complaint",
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
        ),
        body: Container(
          child: TabBarView(
            children: [
              FeatureRequestTab(),
              FeatureRequestTab(),
              FeatureRequestTab(),
            ],
          ),
        ),
      ),
    );
  }
}

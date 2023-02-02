import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/week1&2_model.dart';
import '../../../utilites/constants.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/my_submissionTab_widget.dart';
import '../elimination_details/my_submission_tab_elimination.dart';
import '../series_derails/my_submission_days_tab.dart';

class SlamMySubmissionTab extends StatefulWidget {
  const SlamMySubmissionTab({Key? key}) : super(key: key);

  @override
  State<SlamMySubmissionTab> createState() => _SlamMySubmissionTabState();
}

class _SlamMySubmissionTabState extends State<SlamMySubmissionTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
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
                        title: "6th",
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Week 3 Standing:   ",
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: "16.7 inches behind the cut",
                          style: TextStyle(
                            color: kTextRedColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: weekModelList.length,
                      itemBuilder: (context, index) {
                        return DaysWidget(
                          week: weekModel[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
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
    );
  }
}

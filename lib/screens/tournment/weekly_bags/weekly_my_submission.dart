import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/week1&2_model.dart';
import '../../../utilites/constants.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/my_submissionTab_widget.dart';

class WeeklySubmissionTab extends StatefulWidget {
  const WeeklySubmissionTab({Key? key}) : super(key: key);

  @override
  State<WeeklySubmissionTab> createState() => _WeeklySubmissionTabState();
}

class _WeeklySubmissionTabState extends State<WeeklySubmissionTab> {
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
                    height: 20.h,
                  ),
                  Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: weekModelList.length,
                      itemBuilder: (context, index) {
                        return WeeklyMySubmissionWidget(
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

class WeeklyMySubmissionWidget extends StatelessWidget {
  final WeekModel? week;

  const WeeklyMySubmissionWidget({Key? key, this.week}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 10.h,
        ),
        // Row(
        //   children: [
        //     CustomText(
        //       title: "Slot ${week!.counter}:",
        //       fontWeight: FontWeight.w700,
        //       fontSize: 13,
        //       color: kBlackColor,
        //     ),
        //     CustomText(
        //       title: week!.sortTitle,
        //       fontWeight: FontWeight.w700,
        //       fontSize: 13,
        //       color: kBlackColor,
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 8.h,
        ),
        Card(
          elevation: 2,
          margin: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 56.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      week!.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: week!.title,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                        color: kBlackColor,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomText(
                        title: week!.date,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        color: kBlackColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

import 'package:app/model/week1&2_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/custom_text.dart';

class Week1And2Tab extends StatefulWidget {
  const Week1And2Tab({Key? key}) : super(key: key);

  @override
  State<Week1And2Tab> createState() => _Week1And2TabState();
}

class _Week1And2TabState extends State<Week1And2Tab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
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
                  text: "You Were 8.2 Inches Behind The Cut",
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
                return WeekWidget(
                  week: weekModel[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WeekWidget extends StatelessWidget {
  final WeekModel? week;

  const WeekWidget({Key? key, this.week}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            CustomText(
              title: "Slot ${week!.counter}:",
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: kBlackColor,
            ),
            CustomText(
              title: week!.sortTitle,
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: kBlackColor,
            ),
          ],
        ),
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

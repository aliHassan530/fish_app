import 'package:app/utilites/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/week1&2_model.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/my_submissionTab_widget.dart';
import '../elimination_details/my_submission_tab_elimination.dart';
import '../weekly_bags/weekly_my_submission.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: "Rainbow Trout Weekly Bags",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: kBlackColor,
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CustomText(
                  title: "Profile",
                  color: kSecoundryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              height: 400,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                color: kMainColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 38,
                      ),
                      Expanded(
                        child: BarChart(
                          BarChartData(
                            maxY: 22,
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.grey,
                                getTooltipItem: (a, b, c, d) => null,
                              ),
                              touchCallback: (FlTouchEvent event, response) {
                                if (response == null || response.spot == null) {
                                  setState(() {
                                    touchedGroupIndex = -1;
                                    showingBarGroups = List.of(rawBarGroups);
                                  });
                                  return;
                                }

                                touchedGroupIndex =
                                    response.spot!.touchedBarGroupIndex;

                                setState(() {
                                  if (!event.isInterestedForInteractions) {
                                    touchedGroupIndex = -1;
                                    showingBarGroups = List.of(rawBarGroups);
                                    return;
                                  }
                                  showingBarGroups = List.of(rawBarGroups);
                                  if (touchedGroupIndex != -1) {
                                    var sum = 0.0;
                                    for (final rod
                                        in showingBarGroups[touchedGroupIndex]
                                            .barRods) {
                                      sum += rod.toY;
                                    }
                                    final avg = sum /
                                        showingBarGroups[touchedGroupIndex]
                                            .barRods
                                            .length;

                                    showingBarGroups[touchedGroupIndex] =
                                        showingBarGroups[touchedGroupIndex]
                                            .copyWith(
                                      barRods:
                                          showingBarGroups[touchedGroupIndex]
                                              .barRods
                                              .map((rod) {
                                        return rod.copyWith(toY: avg);
                                      }).toList(),
                                    );
                                  }
                                });
                              },
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 42,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 28,
                                  interval: 1,
                                  getTitlesWidget: leftTitles,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: true,
                            ),
                            barGroups: showingBarGroups,
                            gridData: FlGridData(show: true),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: kSecoundryColor, width: 2),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      title: "Current Total",
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  ],
                ),
                ChatSelectOptionWidget(
                  title: "Added Fish Length",
                ),
                ChatSelectOptionWidget(
                  title: "Culled Fish Length",
                ),
              ],
            ),
            Row(
              children: [
                Container(
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
                        title: "4/5",
                        subtitle: "Live Well",
                      ),
                      MySubmissionTabWidget(
                        title: "39”",
                        subtitle: "Length",
                      ),
                      MySubmissionTabWidget(
                        title: "79",
                        subtitle: "XP Earned",
                      ),
                    ],
                  ),
                ),
              ],
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
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: kSecoundryColor,
      fontWeight: FontWeight.bold,
      fontSize: 11,
    );
    String text;
    if (value == 0) {
      text = '0”';
    } else if (value == 2) {
      text = '10”';
    } else if (value == 4) {
      text = '20”';
    } else if (value == 6) {
      text = '30”';
    } else if (value == 8) {
      text = '40”';
    } else if (value == 10) {
      text = '50”';
    } else if (value == 12) {
      text = '60”';
    } else if (value == 14) {
      text = '60”';
    } else if (value == 16) {
      text = '70””';
    } else if (value == 18) {
      text = '80””';
    } else if (value == 20) {
      text = '90””';
    } else if (value == 22) {
      text = '100””';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: kSecoundryColor,
        fontWeight: FontWeight.w400,
        fontSize: 11,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        // BarChartRodData(
        //   toY: y1,
        //   color: leftBarColor,
        //   width: width,
        // ),
        BarChartRodData(
          toY: y2,
          borderRadius: BorderRadius.circular(0),
          color: kSecoundryColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}

class ChatSelectOptionWidget extends StatefulWidget {
  const ChatSelectOptionWidget({
    this.title,
  });

  final title;

  @override
  State<ChatSelectOptionWidget> createState() => _ChatSelectOptionWidgetState();
}

class _ChatSelectOptionWidgetState extends State<ChatSelectOptionWidget> {
  bool selectValue = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectValue = !selectValue;
        setState(() {});
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: selectValue ? kSecoundryColor : kMainColor,
              border: Border.all(color: kSecoundryColor, width: 2),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          CustomText(
            title: "Current Total",
            fontWeight: FontWeight.w400,
            fontSize: 11,
          ),
        ],
      ),
    );
  }
}

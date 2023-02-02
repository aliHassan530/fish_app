import 'package:app/model/activity_elimimnation_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/custom_button.dart';

class SeriesActivityTab extends StatefulWidget {
  const SeriesActivityTab({Key? key}) : super(key: key);

  @override
  State<SeriesActivityTab> createState() => _SeriesActivityTabState();
}

class _SeriesActivityTabState extends State<SeriesActivityTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: activeEliminationList.length,
          itemBuilder: (context, index) {
            return ActivityEliminationWidget(
              active: activeElimination[index],
              // homeWidget: headerProfile[index],
            );
          },
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

class ActivityEliminationWidget extends StatelessWidget {
  final ActivityEliminationModel? active;

  const ActivityEliminationWidget({Key? key, this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: -4,
      leading: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 30.h,
            width: 30.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                active!.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      title: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: CustomText(
          title: active!.title,
          fontWeight: FontWeight.w400,
          fontSize: 11,
          color: kGreyDarkColor,
        ),
      ),
      subtitle: CustomText(
        title: active!.subtitle,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: kBlackColor,
      ),
    );
  }
}

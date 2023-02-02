import 'package:app/model/home_widget_model.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/tournment/slam_detail/slam_detail.dart';
import '../utilites/constants.dart';
import '../utilites/helper.dart';

class SlamWidget extends StatelessWidget {
  final HomeWidgetModel? home;

  const SlamWidget({Key? key, this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Helper.toScreen(context, SlamDetailScreen());
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        height: 276.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: kGreyLightColor.withOpacity(0.5))),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: kMainColor,
                  child: Image.asset(
                    home!.bgImage,
                    height: 176.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 176.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ListTile(
                        title: CustomText(
                          title: home!.fishName,
                          fontSize: 16,
                          maxLines: 1,
                          fontWeight: FontWeight.w700,
                          color: kMainColor,
                        ),
                        subtitle: Row(
                          children: [
                            Image.asset(
                              "assets/clock-10.png",
                              height: 15.h,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Flexible(
                              child: CustomText(
                                title: home!.time,
                                fontSize: 13,
                                maxLines: 1,
                                fontWeight: FontWeight.w500,
                                color: kMainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            ListTile(
              leading: Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    home!.profileImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: home!.postion,
                    fontSize: 11,
                    maxLines: 1,
                    fontWeight: FontWeight.w700,
                    color: kGreyDarkColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomText(
                    title: home!.titleName,
                    fontSize: 14,
                    maxLines: 1,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                  ),
                ],
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 2.h),
                child: CustomText(
                  title: home!.subtitle,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: kSecoundryColor,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}

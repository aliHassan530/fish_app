import 'package:app/model/home_widget_model.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';

class ActiveTournamentsHomeWidget extends StatelessWidget {
  final HomeWidgetModel? activeTournaments;

  const ActiveTournamentsHomeWidget({Key? key, this.activeTournaments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: MediaQuery.of(context).size.width * 0.67,
      height: 230.h,
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
                  activeTournaments!.bgImage,
                  height: 130.h,
                  width: MediaQuery.of(context).size.width * 0.67,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 130.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      title: CustomText(
                        title: activeTournaments!.fishName,
                        fontSize: 12,
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
                              title: activeTournaments!.time,
                              fontSize: 11,
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
              height: 30,
              width: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  activeTournaments!.profileImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: activeTournaments!.postion,
                  fontSize: 11,
                  maxLines: 1,
                  fontWeight: FontWeight.w700,
                  color: kGreyDarkColor,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  title: activeTournaments!.titleName,
                  fontSize: 12,
                  maxLines: 1,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                ),
              ],
            ),
            subtitle: Container(
              margin: EdgeInsets.only(top: 2.h),
              child: CustomText(
                title: activeTournaments!.subtitle,
                fontSize: 10,
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
    );
  }
}

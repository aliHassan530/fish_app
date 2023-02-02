import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/setting_refer_model.dart';
import '../../utilites/constants.dart';
import '../../widget/activity_tab_achievement_widget.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';

class SettingReferAFriend extends StatefulWidget {
  const SettingReferAFriend({Key? key}) : super(key: key);

  @override
  State<SettingReferAFriend> createState() => _SettingReferAFriendState();
}

class _SettingReferAFriendState extends State<SettingReferAFriend> {
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
          title: "Referrals",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: kBlackColor,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/Rectangle 2600 (3).png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: settingRefer.length,
                itemBuilder: (context, index) {
                  return SettingReferAFriendWidget(
                    refer: settingRefer[index],
                    ind: index,
                    // homeWidget: headerProfile[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomText(
              title: "Achievements - The Gift of Fishing",
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: kGreyLightColor.withOpacity(0.3),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActvityTabAchievementWidget(
                    image: "assets/image 7 (4).png",
                    title: "Refer\n 1 Friend",
                    // color: kMainColor.withOpacity(0.7),
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  ActvityTabAchievementWidget(
                    image: "assets/image 7 (4).png",
                    title: "Refer\n 3 Friend",
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: kMainColor.withOpacity(0.7),
                  ),
                  ActvityTabAchievementWidget(
                    image: "assets/image 7 (4).png",
                    title: "Refer\n 5 Friend",
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: kMainColor.withOpacity(0.7),
                  ),
                  ActvityTabAchievementWidget(
                    image: "assets/image 7 (4).png",
                    title: "Refer\n 10 Friend",
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: kMainColor.withOpacity(0.7),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              title: "Your Custom Referrel Link",
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: kBlackColor,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 7.h,
            ),
            CustomText(
              title: "mylink.fishmasterslive.fake/referrel/thomasfuel",
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: kBlackColor,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              title: "Copy Link",
              btnColor: kMainColor,
              textColor: kGreyDarkColor,
              btnBorderColor: kBlackColor,
              btnRadius: 10,
            ),
            SizedBox(
              height: 23.h,
            ),
            CustomText(
              title: "Terms and Conditions",
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingReferAFriendWidget extends StatelessWidget {
  final SettingReferModel? refer;
  final ind;

  SettingReferAFriendWidget({Key? key, this.refer, this.ind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: MediaQuery.of(context).size.width * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  refer!.img,
                  fit: BoxFit.cover,
                  height: 80.h,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomText(
                    title: refer!.title,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomText(
                    title: refer!.subTitle,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kBlackColor,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomText(
                    title: refer!.remaining,
                    fontSize: 12,
                    color: kGreyDarkColor,
                    fontWeight: FontWeight.w700,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: FAProgressBar(
            currentValue: 30,
            size: 7.h,
            animatedDuration: Duration(seconds: 3),
            progressColor: kSecoundryColor,
            backgroundColor: kGreyLightColor.withOpacity(0.3),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

import 'package:animations/animations.dart';
import 'package:app/screens/alert_box/setting_logout.dart';
import 'package:app/screens/profile_setting_menu/setting_account_information.dart';
import 'package:app/screens/profile_setting_menu/setting_contact_us.dart';
import 'package:app/screens/profile_setting_menu/setting_notification.dart';
import 'package:app/screens/profile_setting_menu/setting_refer_a_friend.dart';
import 'package:app/screens/profile_setting_menu/setting_request.dart';
import 'package:app/widget/setting_listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../utilites/helper.dart';
import '../../widget/custom_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
          title: "Peacock Bass",
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
            SizedBox(
              height: 20.h,
            ),
            SettingListTileWidget(
              onTap: () {
                Helper.toScreen(context, SettingAccountInformation());
              },
              icon: Icon(
                Icons.account_box,
                color: kGreyLightColor,
              ),
              title: "Account Information",
            ),
            SettingListTileWidget(
              onTap: () {
                Helper.toScreen(context, SettingNotification());
              },
              icon: Icon(
                Icons.notification_important_outlined,
                color: kGreyLightColor,
              ),
              title: "Manage Notifications",
            ),
            SettingListTileWidget(
              onTap: () {
                Helper.toScreen(context, SettingRequestScreen());
              },
              icon: Icon(
                Icons.person_add,
                color: kGreyLightColor,
              ),
              title: "Request Tournament or Species",
            ),
            SettingListTileWidget(
              onTap: () {
                Helper.toScreen(context, SettingContactUs());
              },
              icon: Icon(
                Icons.call,
                color: kGreyLightColor,
              ),
              title: "Contact Us",
            ),
            SettingListTileWidget(
              icon: Icon(
                Icons.border_color,
                color: kGreyLightColor,
              ),
              title: "Terms of Service",
            ),
            SettingListTileWidget(
              icon: Icon(
                Icons.privacy_tip_outlined,
                color: kGreyLightColor,
              ),
              title: "Privacy Policy",
            ),
            SettingListTileWidget(
              onTap: () {
                Helper.toScreen(context, SettingReferAFriend());
              },
              icon: Icon(
                Icons.account_circle_outlined,
                color: kGreyLightColor,
              ),
              title: "Refer a Friend Program",
            ),
            SettingListTileWidget(
              onTap: () {
                showModal(
                  context: context,
                  configuration: FadeScaleTransitionConfiguration(
                      transitionDuration: Duration(milliseconds: 800)),
                  builder: (BuildContext context) {
                    return SettingLogOut();
                  },
                );
              },
              icon: Icon(
                Icons.logout,
                color: kGreyLightColor,
              ),
              title: "Logout",
            ),
            SizedBox(
              height: 28.h,
            ),
            CustomText(
              title: "Lets Talk! ",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kBlackColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomText(
              title: "We want to hear from you! Follow us!",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kBlackColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: kGreyColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                      child: Image.asset(
                    "assets/meetrr-insta-icon@3x 1.png",
                    height: 24,
                  )),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: kGreyColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                      child: Image.asset(
                    "assets/meetrr-fb-icon@3x 1.png",
                    height: 24,
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}


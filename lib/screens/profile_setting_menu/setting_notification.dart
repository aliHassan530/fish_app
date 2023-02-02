import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';

class SettingNotification extends StatefulWidget {
  const SettingNotification({Key? key}) : super(key: key);

  @override
  State<SettingNotification> createState() => _SettingNotificationState();
}

class _SettingNotificationState extends State<SettingNotification> {
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
          title: "Manage Notifications",
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
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              title: "Tournament Notifications",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: kGreyDarkColor,
            ),
            SettingNotificationWidget(
              title: "Tournament Start / End",
              subtitle: "You’ll be notified when a tournament starts or ends",
            ),
            SettingNotificationWidget(
              title: "Cutline Reminders",
              subtitle: "You’ll be notified when a tournament starts or ends",
            ),
            SettingNotificationWidget(
              title: "Daily Tournament Updates",
              subtitle: "You’ll be notified when a tournament starts or ends",
            ),
            SettingNotificationWidget(
              title: "Weekly Tournament Updates",
              subtitle: "You’ll be notified when a tournament starts or ends",
            ),
            SettingNotificationWidget(
              title: "User Submissions",
              subtitle: "You’ll be notified when a tournament starts or ends",
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              title: "Activity Notifications",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: kGreyDarkColor,
            ),
            SettingNotificationWidget(
              title: "Post Likes",
              subtitle: "When someone likes your posts",
            ),
            SettingNotificationWidget(
              title: "Follows",
              subtitle: "When someone follows you, requests, or accepts",
            ),
            SettingNotificationWidget(
              title: "Messages",
              subtitle: "When someone sends you a message",
            ),
            SettingNotificationWidget(
              title: "Fish Masters Live",
              subtitle: "Important messages from Fish Masters Live",
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingNotificationWidget extends StatefulWidget {
  const SettingNotificationWidget({
    this.title,
    this.subtitle,
  });

  final title;
  final subtitle;

  @override
  State<SettingNotificationWidget> createState() =>
      _SettingNotificationWidgetState();
}

class _SettingNotificationWidgetState extends State<SettingNotificationWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        border: Border.all(color: kGreyLightColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: CustomText(
          title: widget.title,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: kBlackColor,
          maxLines: 1,
        ),
        subtitle: CustomText(
          title: widget.subtitle,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: kBlackColor,
        ),
        trailing: Container(
          height: 23,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isSwitched ? kSecoundryColor : kGreyColor,
          ),
          child: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            inactiveTrackColor: kGreyColor,
            activeTrackColor: kSecoundryColor,
            activeColor: kMainColor,
            inactiveThumbColor: kMainColor,
          ),
        ),
      ),
    );
  }
}

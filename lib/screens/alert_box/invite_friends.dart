import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_button.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteFriendsAlertBox extends StatefulWidget {
  @override
  _InviteFriendsAlertBoxState createState() => _InviteFriendsAlertBoxState();
}

class _InviteFriendsAlertBoxState extends State<InviteFriendsAlertBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: kGreyLightColor.withOpacity(0.6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kMainColor.withOpacity(0.8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomText(
                      title: "Invite friend to join tournament",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: kGreyDarkColor,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: kGreyLightColor.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomText(
                      title: "Send Invite",
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: kSecoundryColor,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      color: kGreyLightColor.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomText(
                      title: "Referral Program",
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: kSecoundryColor,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 23.33.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: kMainColor,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kMainColor,
                  ),
                  child: CustomButton(
                    btnRadius: 10,
                    btnHeight: 56.h,
                    btnColor: kMainColor,
                    fontSize: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    fontWeight: FontWeight.w600,
                    title: "Cancel",
                    textColor: kRedDarkColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

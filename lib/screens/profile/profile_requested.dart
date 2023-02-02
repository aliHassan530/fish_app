import 'package:app/screens/profile/profile_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import '../../widget/rounded_text_widget.dart';

class ProfileRequestedScreen extends StatefulWidget {
  const ProfileRequestedScreen({Key? key}) : super(key: key);

  @override
  State<ProfileRequestedScreen> createState() => _ProfileRequestedScreenState();
}

class _ProfileRequestedScreenState extends State<ProfileRequestedScreen> {
  bool fellow = false;

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
                )
              ],
            ),
          ),
        ),
        title: CustomText(
          title: "Thomas Fuel",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: kBlackColor,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
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
            CustomText(
              title: "ELITE LEVEL 3",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: kGreyDarkColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: FAProgressBar(
                currentValue: 30,
                size: 7.h,
                animatedDuration: Duration(seconds: 3),
                progressColor: kSecoundryColor,
                backgroundColor: kGreyLightColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomText(
              title: "241 XP until Elite Level 4",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: kGreyDarkColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedTextButtonWidget(
                    title: "748 Followers",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  RoundedTextButtonWidget(
                    title: "40 Following",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 62.h,
            ),
            CustomText(
              title: "This account is private",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: kBlackColor,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomText(
              title:
                  "Follow this profile to see tournament history and fish logs.",
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: kBlackColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  fellow = !fellow;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: fellow ? kGreyLightColor : kSecoundryColor,
                  ),
                  borderRadius: BorderRadius.circular(100),
                  color: fellow ? kMainColor : kSecoundryColor,
                ),
                child: Center(
                  child: CustomText(
                    title: "Requested",
                    color: fellow ? kSecoundryColor : kMainColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

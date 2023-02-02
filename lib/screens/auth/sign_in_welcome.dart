import 'dart:async';

import 'package:app/model/user_model.dart';
import 'package:app/screens/auth/sign_up_subcription_offer.dart';
import 'package:app/screens/bottom_bar/bottom_bar.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/helper.dart';

class SignInWelCome extends StatefulWidget {
  const SignInWelCome({Key? key}) : super(key: key);

  @override
  State<SignInWelCome> createState() => _SignInWelComeState();
}

class _SignInWelComeState extends State<SignInWelCome> {
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    Timer(Duration(seconds: 3), () {
      UserModel.userModel.subscriptionType==""?
      Helper.toScreen(context, SignUpSubcriptionOffer()): Helper.toScreen(context, BottomBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  height: 112.h,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Image.asset(
                "assets/Completing Setup.png",
                height: 36,
                width: 250,
              ),
            ),
            SizedBox(height: 21.h),
            CustomText(
              title: "Downloading tournaments\n and current standings",
              color: kBlackColor,
              fontSize: 14,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 5.h),
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: [
                Container(
                  height: 140.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kSecoundryColor),
                  child: Center(
                      child: Image.asset(
                    "assets/image 19.png",
                    height: 60.h,
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 44.h,
            ),
            FAProgressBar(
              currentValue: 100,
              size: 5,
              animatedDuration: Duration(seconds: 3),
              progressColor: kSecoundryColor,
              backgroundColor: kGreyLightColor,
            ),
          ],
        ),
      ),
    );
  }
}

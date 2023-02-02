import 'dart:async';

import 'package:app/screens/auth/sign_in_welcome.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/helper.dart';

class SignupCompletingSetup extends StatefulWidget {
  const SignupCompletingSetup({Key? key}) : super(key: key);

  @override
  State<SignupCompletingSetup> createState() => _SignupCompletingSetupState();
}

class _SignupCompletingSetupState extends State<SignupCompletingSetup> {
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    Timer(Duration(seconds: 3), () {
      Helper.toScreen(context, SignInWelCome());
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
              title: "All set, we are finishing creating\n your account now!",
              color: kBlackColor,
              textAlign: TextAlign.center,
              fontSize: 14,
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
                    "assets/image 20.png",
                    height: 80.h,
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

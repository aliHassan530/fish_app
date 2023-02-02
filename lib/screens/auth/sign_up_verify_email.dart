import 'dart:async';

import 'package:app/model/user_model.dart';
import 'package:app/screens/auth/sign_up_choose_favourite.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/helper.dart';

class SignUpVerifyEmail extends StatefulWidget {
  const SignUpVerifyEmail({Key? key}) : super(key: key);

  @override
  State<SignUpVerifyEmail> createState() => _SignUpVerifyEmailState();
}

class _SignUpVerifyEmailState extends State<SignUpVerifyEmail> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      print(user!.emailVerified);
      if (user?.emailVerified == true) {
        await FirebaseFirestore.instance
            .collection("user")
            .doc(user.uid)
            .update({
          "isVerified": user.emailVerified,
        });
        Helper.toScreen(context, SignUpChooseFavourite());
        Helper.showSnack(context, "Email Verified Successfully!!!");
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
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
                "assets/Verify your Email.png",
                height: 36,
                width: 250,
              ),
            ),
            SizedBox(height: 21.h),
            CustomText(
              title: "We sent an email to",
              color: kGreyDarkColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 5.h),
            CustomText(
              title: UserModel.userModel.email,
              color: kGreyDarkColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            SizedBox(height: 5.h),
            CustomText(
              title:
                  "Check your email & click the link to activate\n your account",
              color: kGreyDarkColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
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
                    "assets/EmailSent 1.png",
                    height: 80.h,
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 44.h,
            ),
            FAProgressBar(
              currentValue:UserModel.userModel.isVerified==true? 100:60,
              size: 5,
              animatedDuration: Duration(seconds: 5),
              progressColor: kSecoundryColor,
              backgroundColor: kGreyLightColor,
            ),
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () async {
                await AuthServices.auth.currentUser!.sendEmailVerification();
                Helper.showSnack(context, "Please Verify Email!!!");
              },
              child: CustomText(
                title: "Resend Email",
                color: kSecoundryColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                Helper.toRemoveUntiScreen(context, SignUpVerifyEmail());
              },
              child: CustomText(
                title: "Cancel Sign Up",
                color: kRedColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

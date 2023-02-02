import 'dart:async';

import 'package:app/model/user_model.dart';
import 'package:app/screens/auth/sign_add_profile_pitcher.dart';
import 'package:app/screens/auth/sign_up_choose_favourite.dart';
import 'package:app/screens/auth/sign_up_gender_and_birthday.dart';
import 'package:app/screens/auth/sign_up_subcription_offer.dart';
import 'package:app/screens/auth/sign_up_verify_email.dart';
import 'package:app/screens/bottom_bar/bottom_bar.dart';
import 'package:app/screens/on_body_screen/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/auth_services.dart';
import '../utilites/constants.dart';
import '../utilites/helper.dart';
import 'auth/sign_up_name_location.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      await init();
    });
  }

  init() async {
    var user = AuthServices.auth.currentUser;
    if (user != null) {
      await AuthServices.getUserDetails(user.uid);
      await AuthServices.setCurrentUserToMap(user.uid);
      print(user.email);
      if (UserModel.userModel.firstN == "") {
        Helper.toReplacementScreen(context, SignUpNameLocation());
      } else if (UserModel().gender == "") {
        Helper.toReplacementScreen(context, SignUpGenderAndBirthDay());
      } else if (UserModel().image == "") {
        Helper.toReplacementScreen(context, SignAddProfilePitcher());
      } else if (UserModel.userModel.isVerified != true) {
        print(UserModel().image);
        Helper.toReplacementScreen(context, SignUpVerifyEmail());
      } else if (UserModel.userModel.favourite == "") {
        Helper.toReplacementScreen(context, SignUpChooseFavourite());
      } else if (UserModel.userModel.subscriptionType == "") {
        Helper.toReplacementScreen(context, SignUpSubcriptionOffer());
      } else {
        Helper.toReplacementScreen(context, BottomBar());
      }
    } else {
      Helper.toReplacementScreen(context, GetStarted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kBlackColor,
        child: Center(
          child: Image.asset(
            "assets/Group 7.png",
            height: 154.h,
          ),
        ),
      ),
    );
  }
}

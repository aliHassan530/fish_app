import 'package:app/model/user_model.dart';
import 'package:app/screens/bottom_bar/bottom_bar.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/customButtonTextEdit.dart';
import 'package:app/widget/custom_button.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider.dart';
import '../../services/auth_services.dart';
import '../../widget/custom_column_row_text.dart';

class SignUpSubcriptionOffer extends StatefulWidget {
  const SignUpSubcriptionOffer({Key? key}) : super(key: key);

  @override
  State<SignUpSubcriptionOffer> createState() => _SignUpSubcriptionOfferState();
}

class _SignUpSubcriptionOfferState extends State<SignUpSubcriptionOffer> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 50, bottom: 15, right: 15, left: 15),
              color: kSecoundryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    title: "Welcome Gift!",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: kMainColor,
                    textAlign: TextAlign.center,
                  ),
                  CustomText(
                    title:
                        "As a thank you for trying Fish Masters Live, please enjoy our premium features for free for 2 weeks. Cancel anytime!",
                    fontSize: 12,
                    lineHeight: 1.3,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                    color: kMainColor,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 200.h,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/Rectangle 2624.png",
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 200.h,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        title: "Try Elite or Master FREE for 2 weeks!",
                        textColor: kMainColor,
                        btnColor: kRedDarkColor,
                        btnRadius: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomColumnRowText(
                    title: "",
                    rooke: "Rookie\nFree",
                    rookeFw: FontWeight.w700,
                    elite: "Elite\n\$3.99/mo",
                    eliteFw: FontWeight.w700,
                    master: "Master\n\$6.99/mo",
                    masterFw: FontWeight.w700,
                  ),
                  CustomColumnRowText(
                    title: "Tournaments at a Time",
                    rooke: "1",
                    elite: "Unlimited",
                    master: "Unlimited",
                  ),
                  CustomColumnRowText(
                    title: "Offline Fishing Mode",
                    rooke: "✗",
                    elite: "✓",
                    master: "✓",
                  ),
                  CustomColumnRowText(
                    title: "Personal Fishing Log",
                    rooke: "✗",
                    elite: "✗",
                    master: "✓",
                  ),
                  CustomColumnRowText(
                    title: "Personal Log Notes",
                    rooke: "✗",
                    elite: "✗",
                    master: "✓",
                  ),
                  CustomColumnRowText(
                    title: "Catch Weather Data",
                    rooke: "✗",
                    elite: "✗",
                    master: "✓",
                  ),
                  CustomColumnRowText(
                    title: "Logged Fish Images",
                    rooke: "✗",
                    elite: "✗",
                    master: "✓",
                  ),
                  CustomColumnRowText(
                    title: "XP Multiplier",
                    rooke: "✗",
                    elite: "✗",
                    master: "2x",
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomButtonTextEdit(
                    btnWidth: double.infinity,
                    textColor: kMainColor,
                    btnRadius: 10,
                    onPressed: () {
                      Helper.toScreen(context, BottomBar());
                    },
                    btnColor: kRedDarkColor,
                    titleText: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Become a  ",
                            style: TextStyle(
                              color: kMainColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: "Master",
                            style: TextStyle(
                              color: kMainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomButtonTextEdit(
                    btnRadius: 10,
                    btnWidth: double.infinity,
                    textColor: kMainColor,
                    onPressed: () {
                      Helper.toScreen(context, BottomBar());
                    },
                    btnColor: kSecoundryColor,
                    titleText: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Join the ",
                            style: TextStyle(
                              color: kMainColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: "Elites",
                            style: TextStyle(
                              color: kMainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomButtonTextEdit(
                    btnRadius: 10,
                    btnWidth: double.infinity,
                    textColor: kMainColor,
                    onPressed: () async {
                      provider.changeIsLoading(true);
                      await AuthServices.upDateSignUp(
                        firstN: UserModel.userModel.firstN,
                        lastN: UserModel.userModel.lastN,
                        city: UserModel.userModel.city,
                        state: UserModel.userModel.state,
                        gender: UserModel.userModel.gender,
                        subscriptionType: "r",
                        favourite: UserModel.userModel.favourite,
                      );
                      provider.changeIsLoading(false);
                      Helper.toRemoveUntiScreen(context, BottomBar());
                      Helper.showSnack(
                          context, "Select Subcribiton Successfully!!!");
                    },
                    btnBorderColor: kSecoundryColor,
                    btnBorderWidth: 1.5,
                    btnColor: kMainColor,
                    titleText: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Continue as ",
                            style: TextStyle(
                              color: kSecoundryColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: "Rookie",
                            style: TextStyle(
                              color: kGreyDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    title:
                        "This subscription renews monthly. You can cancel anytime in settings. You will not be billed if cancelled 24 hours before renewal period or free trial ends.",
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            color: kBlackColor,
                          )),
                        ),
                        child: CustomText(
                          title: "Restore Purchases",
                          color: kBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: kMainColor,
        child: Container(
          height: 30.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomText(
                title: "Terms of Service and Privacy Policy",
                color: kBlackColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

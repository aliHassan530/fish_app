import 'package:app/screens/auth/login_screen.dart';
import 'package:app/screens/auth/sign_up.dart';
import 'package:app/utilites/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/onbody_widget.dart';

class OnBodyScreen extends StatefulWidget {
  const OnBodyScreen({Key? key}) : super(key: key);

  @override
  State<OnBodyScreen> createState() => _OnBodyScreenState();
}

class _OnBodyScreenState extends State<OnBodyScreen> {
  PageController controller = PageController();
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.73,
            child: PageView(
              // physics: NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (num) {
                setState(() {
                  _curr = num;
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                OnBodyWidget(
                  title: "Welcome to\nFish Masters Live",
                  image: "assets/bass_boats 2.png",
                  subTitle:
                      "Join anglers in the daily virtual fishing tournaments, with 4 different tournament types, dozens of fish species, and tournaments every day.",
                ),
                OnBodyWidget(
                  image: "assets/bass_boats 2 (1).png",
                  title: "Track all your\nPersonal Fishing Logs",
                  subTitle:
                      "Build your personal fishing log, save every catch safely in the cloud, track fish length, catch locations, dates and times, weather data, pressure data and more.",
                ),
                OnBodyWidget(
                  image: "assets/bass_boats 2 (2).png",
                  title: "Trends\nand Insights",
                  subTitle:
                      "Track personal records, view insights to your fishing activities, identify catch trends, and see how your catches rank against others.",
                ),
                OnBodyWidget(
                  image: "assets/bass_boats 2 (3).png",
                  title: "TLeaderboards\nand Achievements",
                  subTitle:
                      "Earn achievements and increase your rank by fishing tournaments and adding to your personal log. See how you rank on the leaderboards against other anglers.",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 200,
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        axisDirection: Axis.horizontal,
                        effect: WormEffect(
                          dotHeight: 9.h,
                          dotWidth: 9.h,
                          strokeWidth: 12,
                          activeDotColor: kSecoundryColor,
                          dotColor: kGreyLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 46.h,
                ),
                _curr == 3
                    ? CustomButton(
                        onPressed: () {
                          Helper.toScreen(context, LoginScreen());
                        },
                        title: "Sign In",
                        btnColor: kSecoundryColor,
                        textColor: kMainColor,
                        btnHeight: 46.h,
                        btnRadius: 25,
                      )
                    : CustomButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeOut);
                        },
                        title: "Next",
                        btnColor: kSecoundryColor,
                        textColor: kMainColor,
                        btnHeight: 46.h,
                        btnRadius: 25,
                      ),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                  onPressed: () {
                    Helper.toScreen(context, SignUpScreen());
                  },
                  title: "Create Account",
                  btnColor: kMainColor,
                  btnBorderColor: kSecoundryColor,
                  textColor: kSecoundryColor,
                  btnHeight: 46.h,
                  btnRadius: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

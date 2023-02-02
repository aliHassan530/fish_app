import 'package:app/model/comment_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/bottom_border_text.dart';
import '../../../widget/comment_widget.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/log_another_data_card_widget.dart';

class LogAnotherUser extends StatefulWidget {
  const LogAnotherUser({Key? key}) : super(key: key);

  @override
  State<LogAnotherUser> createState() => _LogAnotherUserState();
}

class _LogAnotherUserState extends State<LogAnotherUser> {
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
          title: "Peacock Bass",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: kBlackColor,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                Container(
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/Rectangle 2607.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/Rectangle 2600 (4).png"),
                    ),
                  ),
                  title: CustomText(
                    title: "Kendall Riley",
                    color: kBlackColor,
                    fontSize: 14,
                    maxLines: 1,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: CustomText(
                    title: "76 anglers like this ",
                    color: kBlackColor,
                    fontSize: 14,
                    maxLines: 1,
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kSecoundryColor,
                          ),
                          child: Center(
                              child: Image.asset(
                            "assets/comment_button.png",
                            height: 16.16.h,
                          )),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kSecoundryColor,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/like_button.png",
                              height: 16.16.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LogAnotherDateCardWidget(
                      date: "Nov 1, 2022",
                      title: "Log Date",
                    ),
                    LogAnotherDateCardWidget(
                      date: "17 INCHES",
                      title: "Fish Size",
                    ),
                    LogAnotherDateCardWidget(
                      date: "37th",
                      title: "Percentile",
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: "34 Comments",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    BottomBorderText(
                      txt: "View More",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: commentList.length,
                    itemBuilder: (context, index) {
                      return CommentWidget(
                        comment: comment[index],
                        // homeWidget: headerProfile[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: kMainColor,
              // color: kSecoundryColor,
              height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/Rectangle 2600 (4).png"),
                    ),
                  ),
                  Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.74,
                    child: CustomTextField(
                      hintTextColor: kGreyDarkColor,
                      hintText: "Add a comment, @ to mention...",
                      hintFontSize: 13,
                      fieldborderColor: kGreyLightColor,
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kSecoundryColor,
                            ),
                            child: Center(
                                child: Image.asset(
                              "assets/send_icon 1 (1).png",
                              height: 16.16.h,
                            )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


import 'dart:io';

import 'package:animations/animations.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_button.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/log_verify_measurements_model.dart';
import '../../widget/log_fish_verify_measurements_widget.dart';
import '../../widget/select_tool.dart';
import '../alert_box/delete_upload_alert.dart';

class LogFishVerifyMeasurements extends StatefulWidget {
  LogFishVerifyMeasurements({
    this.image,
  });

  final image;

  @override
  State<LogFishVerifyMeasurements> createState() =>
      _LogFishVerifyMeasurementsState();
}

class _LogFishVerifyMeasurementsState extends State<LogFishVerifyMeasurements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          title: "Verify Measurements",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: kBlackColor,
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 390.h,
              child: widget.image == null
                  ? Center(
                      child: CustomText(
                        title: "No Image",
                        color: kMainColor,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Image.file(
                      File(widget.image),
                      height: 300,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SelectTool(
                            icon: "assets/Union.png",
                            title: "Discard \nLog",
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          SelectTool(
                            icon: "assets/ruler.png",
                            title: "Recapture \nImage",
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          _confirmMeasure(context);
                        },
                        child: SelectTool(
                          icon: "assets/ruler.png",
                          title: "Revert \nChanges",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _confirmMeasure(context);
                          },
                          child: Image.asset(
                            "assets/LargemouthBass 1.png",
                            height: 106.h,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          title:
                              "Height measurement should NOT include dorsal and pelvic fins",
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          color: kBlackColor,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    title: "16.8489 Inches",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: kBlackColor,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomText(
                                    title: "Total Length",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: kGreyLightColor,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    title: "5.5832 Inches",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: kBlackColor,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomText(
                                    title: "Girth Height",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: kGreyLightColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: logVerifyList.length,
                      itemBuilder: (context, index) {
                        return LogVerifyCardWidget(
                          verify: logVerify[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmMeasure(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: kSecoundryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (BuildContext _) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          height: 225,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: kSecoundryColor,
          ),
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Rectangle 9.png",
                      height: 20.h,
                      width: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  onPressed: () {
                    _confiremSpecies(context);
                  },
                  title: "Confirm Measurement",
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  btnColor: kMainColor,
                  btnRadius: 100,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomText(
                  title:
                      "By continuing you confirm your measurement is accurate to the best of your ability and knowledge. Obvious attemps for cheating will be disqualified. If the measurement is wrong and lines are correct, please recapture the image.",
                  fontSize: 13,
                  color: kMainColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  void _confiremSpecies(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: kSecoundryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (BuildContext _) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          height: 225,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: kSecoundryColor,
          ),
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Rectangle 9.png",
                      height: 20.h,
                      width: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  onPressed: () {
                    _upload(context);
                  },
                  title: "Confirm Species",
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  btnColor: kMainColor,
                  btnRadius: 100,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomText(
                  title:
                      "By continuing you confirm your species is accurate to the best of your ability and knowledge. Obvious attemps for cheating will be disqualified.",
                  fontSize: 13,
                  color: kMainColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  void _upload(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: kSecoundryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (BuildContext _) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          height: 115,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: kSecoundryColor,
          ),
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Rectangle 9.png",
                      height: 20.h,
                      width: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  title: "Upload",
                  onPressed: () {
                    showModal(
                      context: context,
                      configuration: FadeScaleTransitionConfiguration(
                          transitionDuration: Duration(milliseconds: 800)),
                      builder: (BuildContext context) {
                        return DeleteUploadAlert();
                      },
                    );
                  },
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  btnColor: kMainColor,
                  btnRadius: 100,
                ),
              ],
            ),
          ),
        );
      },
      isScrollControlled: true,
    );
  }
}



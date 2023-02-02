import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpGradeAlert extends StatefulWidget {
  @override
  _UpGradeAlertState createState() => _UpGradeAlertState();
}

class _UpGradeAlertState extends State<UpGradeAlert> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomText(
                          title: "Pro Feature Not Enambled",
                          fontWeight: FontWeight.w900,
                          fontSize: 17,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomText(

                          title:
                         "Saving fish to your personal log and tracking log insights, data, and metrics requires upgraded version. View upgrade options?",
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 23.33.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      border: Border(
                        top:
                        BorderSide(color: kGreyLightColor.withOpacity(0.3)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                          title: "Skip",
                          fontSize: 17,
                          color: kSecoundryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        Container(
                          height: 45.h,
                          child: VerticalDivider(
                            color: kGreyLightColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomText(
                            title: "Delete",
                            fontSize: 17,
                            color: kSecoundryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/log_verify_measurements_model.dart';

class LogVerifyCardWidget extends StatefulWidget {
  final LogVerifyMeasurementsModel? verify;

  const LogVerifyCardWidget({Key? key, this.verify}) : super(key: key);

  @override
  State<LogVerifyCardWidget> createState() => _LogVerifyCardWidgetState();
}

class _LogVerifyCardWidgetState extends State<LogVerifyCardWidget> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          select = !select;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10.h,
          ),
          // Row(
          //   children: [
          //     CustomText(
          //       title: "Slot ${week!.counter}:",
          //       fontWeight: FontWeight.w700,
          //       fontSize: 13,
          //       color: kBlackColor,
          //     ),
          //     CustomText(
          //       title: week!.sortTitle,
          //       fontWeight: FontWeight.w700,
          //       fontSize: 13,
          //       color: kBlackColor,
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 8.h,
          ),
          Card(
            elevation: 2,
            margin: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 56.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.verify!.image,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: widget.verify!.title,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                              color: kBlackColor,
                            ),
                            select
                                ? Container(
                                    child: Image.asset(
                                      "assets/Vector (71).png",
                                      height: 22.h,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        CustomText(
                          title: widget.verify!.subtitle,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          color: kGreyLightColor,
                        ),
                        SizedBox(
                          height: 8.h,
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
                        )
                      ],
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

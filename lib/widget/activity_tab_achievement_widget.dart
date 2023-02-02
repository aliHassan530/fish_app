import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActvityTabAchievementWidget extends StatelessWidget {
  ActvityTabAchievementWidget({
    this.image,
    this.title,
    this.width,
    this.color,
  });

  final image;
  final title;
  final width;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.27,
      // width: MediaQuery.of(context).size.width * 0.27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 60.h,
              ),
              CustomText(
                textAlign: TextAlign.center,
                title: title,
                fontSize: 11,
                // title: "South East\nSalty Slam\nWeek 52 2022",
              ),
            ],
          ),
          Positioned.fill(
            child: Container(
              color: color,
            ),
          )
        ],
      ),
    );
  }
}

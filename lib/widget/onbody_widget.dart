import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';

class OnBodyWidget extends StatefulWidget {
  OnBodyWidget({this.image, this.title, this.subTitle});

  final image;
  final title;
  final subTitle;

  @override
  State<OnBodyWidget> createState() => _OnBodyWidgetState();
}

class _OnBodyWidgetState extends State<OnBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          // height: MediaQuery.of(context).size.height * 0.5,
          height: 348.h,
          child: Image.asset(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: kGreyColor)),
                child: Image.asset(
                  "assets/LogoCircled@3x 2.png",
                  height: 60.h,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomText(
                title: widget.title,
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: kBlackColor,
              ),
              SizedBox(
                height: 11.h,
              ),
              CustomText(
                title: widget.subTitle,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: kGreyColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 46.h,
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 15),
        //   child: CustomButton(
        //     title: "Get Started",
        //     btnColor: kSecoundryColor,
        //     textColor: kMainColor,
        //     btnHeight: 46.h,
        //     btnRadius: 25,
        //   ),
        // )
      ],
    );
  }
}

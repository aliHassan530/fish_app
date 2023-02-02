import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectTool extends StatefulWidget {
  const SelectTool({
    this.icon,
    this.title,
  });

  final icon;
  final title;

  @override
  State<SelectTool> createState() => _SelectToolState();
}

class _SelectToolState extends State<SelectTool> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        select = !select;
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            height: 54.h,
            width: 54.w,
            decoration: BoxDecoration(
              color: select ? kGreyLightColor : kSecoundryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image.asset(
                widget.icon,
                height: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            title: widget.title,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: select ? kGreyLightColor : kBlackColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

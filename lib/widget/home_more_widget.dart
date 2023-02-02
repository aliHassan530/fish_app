import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';

import '../../utilites/constants.dart';

class HomeMoreWidget extends StatelessWidget {
  const HomeMoreWidget({
    this.title,
    this.trailing,
    this.onTap,
  });

  final title;
  final trailing;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            title: title,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: kBlackColor,
          ),
          InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              onTap!();
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: kSecoundryColor,
                )),
              ),
              child: CustomText(
                title: trailing,
                color: kSecoundryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

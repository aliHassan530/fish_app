import 'package:app/utilites/constants.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_text.dart';

class TabText extends StatelessWidget {
  const TabText({
    this.title,
  });

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      // width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: kSecoundryColor.withOpacity(0.2)),
      ),
      child: Center(
        child: CustomText(
          title: title,
        ),
      ),
    );
  }
}

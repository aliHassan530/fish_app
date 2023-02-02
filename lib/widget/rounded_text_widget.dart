import 'package:flutter/material.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';

class RoundedTextButtonWidget extends StatelessWidget {
  const RoundedTextButtonWidget({
    this.title,
  });

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: kSecoundryColor.withOpacity(0.2)),
      ),
      child: Center(
        child: CustomText(
          title: title,
          maxLines: 1,
          color: kSecoundryColor,
        ),
      ),
    );
  }
}

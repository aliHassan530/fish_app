import 'package:flutter/material.dart';

import '../../../utilites/constants.dart';
import '../../../widget/custom_text.dart';

class LogCurrentListTileWidget extends StatelessWidget {
  const LogCurrentListTileWidget({
    this.title,
    this.trailing,
  });

  final title;
  final trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(
        vertical: -4,
      ),
      contentPadding: EdgeInsets.zero,
      title: CustomText(
        title: title,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: kSecoundryColor,
      ),
      trailing: CustomText(
        title: trailing,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: kSecoundryColor,
      ),
    );
  }
}

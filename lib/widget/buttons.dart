
import 'package:flutter/material.dart';

import 'package:expense_tracker/styles/color_styles.dart';
import 'package:expense_tracker/styles/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final Icon icon;

  PrimaryButton({@required this.buttonText, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: new BorderRadius.circular(6.0),
      splashColor: ColorStyles.primaryColor,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: ColorStyles.primaryAccent),
          child: new Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(buttonText,
                    style: TextStyles.bodyMedium.copyWith(color: Colors.white)),
                new Visibility(
                  visible: (icon != null),
                  child: new Padding(
                      padding: const EdgeInsets.only(left: 8.0), child: icon),
                ),
              ],
            ),
          )),
    );
  }
}

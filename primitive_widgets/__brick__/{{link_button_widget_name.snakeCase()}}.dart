import 'package:flutter/material.dart';

class {{link_button_widget_name.pascalCase()}} extends StatelessWidget {
  final String text;
  final String linkText;
  final TextStyle? textStyle;
  final TextStyle? linkTextStyle;
  final Function()? onPressed;
  final double? fontSize;

  const {{link_button_widget_name.pascalCase()}}({
    Key? key,
    required this.text,
    required this.linkText,
    this.textStyle,
    this.linkTextStyle,
    this.onPressed,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: textStyle,
          ),
          Text(
            linkText,
            style: linkTextStyle,
          ),
        ],
      ),
    );
  }
}

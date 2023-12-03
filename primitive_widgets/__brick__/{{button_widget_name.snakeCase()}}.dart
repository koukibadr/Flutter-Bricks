import 'package:flutter/material.dart';

class {{button_widget_name.pascalCase()}} extends StatelessWidget {
  final Widget child;
  final Color? buttonColor;
  final Gradient? gradient;
  final double cornerRadius;
  final Function() onPressed;
  final Color? disabledColor;
  final bool enabled;
  final bool showDisabledColor;
  final Widget? suffixIcon;
  final double width;
  final double height;
  final TextStyle? textStyle;

  const {{button_widget_name.pascalCase()}}({
    super.key,
    required this.child,
    required this.onPressed,
    this.buttonColor,
    this.gradient,
    this.cornerRadius = 0,
    this.disabledColor,
    this.suffixIcon,
    this.enabled = true,
    this.showDisabledColor = false,
    this.height = 50,
    this.width = 300,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onPressed : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: showDisabledColor
              ? disabledColor
              : buttonColor ?? Theme.of(context).primaryColor,
          gradient: gradient,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: suffixIcon == null
            ? Center(
                child: child,
              )
            : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    child,
                    suffixIcon!,
                  ],
                ),
            ),
      ),
    );
  }
}

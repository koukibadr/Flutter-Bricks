import 'package:flutter/material.dart';

class {{checkbox_widget_name.pascalCase()}} extends StatefulWidget {
  final String label;
  final Function(bool?)? onEdit;
  final Function()? onTextPressed;
  final TextStyle? labelStyle;
  final bool isChecked;
  final Color? activeColor;
  final Color? focusedColor;
  final Color? hoveredColor;
  final Color? selectedColor;
  final Color? onErrorColor;
  final bool isError;
  final FocusNode? focusNode;

  const CheckboxWidget({
    Key? key,
    required this.label,
    this.onEdit,
    this.onTextPressed,
    this.labelStyle,
    this.isChecked = false,
    this.activeColor,
    this.focusedColor,
    this.selectedColor,
    this.hoveredColor,
    this.onErrorColor,
    this.isError = false,
    this.focusNode,
  }) : super(key: key);

  @override
  State<{{checkbox_widget_name.pascalCase()}}> createState() => _{{checkbox_widget_name.pascalCase()}}State();
}

class _{{checkbox_widget_name.pascalCase()}}State extends State<{{checkbox_widget_name.pascalCase()}}> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onEdit?.call(!widget.isChecked);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1,
            child: Checkbox(
              focusNode: widget.focusNode,
              isError: widget.isError,
              fillColor: MaterialStateColor.resolveWith((states) =>
                  checkboxStateColor(states) ?? Theme.of(context).primaryColor),
              value: widget.isChecked,
              onChanged: (checked) {
                widget.onEdit?.call(checked);
              },
              checkColor: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              widget.label,
              style:
                  widget.labelStyle ?? Theme.of(context).textTheme.labelMedium,
            ),
          )
        ],
      ),
    );
  }

  Color? checkboxStateColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return widget.focusedColor;
    } else if (states.contains(MaterialState.hovered)) {
      return widget.hoveredColor;
    } else if (states.contains(MaterialState.selected)) {
      return widget.selectedColor;
    } else if (states.contains(MaterialState.error)) {
      return widget.onErrorColor;
    } else {
      return Theme.of(context).primaryColor;
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class {{text_field_widget_name.pascalCase()}} extends StatefulWidget {
  final String label;
  final double width;
  final TextEditingController? textController;
  final TextInputType? keyboardType;
  final Function(String?)? onEdit;
  final String errorMessage;
  final bool displayErrorMessage;
  final int? maxLines;
  final Widget? suffixIcon;
  final Color? channelColor;
  final bool isPassword;

  const {{text_field_widget_name.pascalCase()}}({
    super.key,
    this.label = '',
    this.width = 300,
    this.textController,
    this.keyboardType,
    this.onEdit,
    this.displayErrorMessage = false,
    this.errorMessage = '',
    this.maxLines = 1,
    this.suffixIcon,
    this.channelColor,
    this.isPassword = false,
  });

  @override
  State<{{text_field_widget_name.pascalCase()}}> createState() =>
      _{{text_field_widget_name.pascalCase()}}State();
}

class _{{text_field_widget_name.pascalCase()}}State extends State<{{text_field_widget_name.pascalCase()}}> {
  late bool obscureText = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: widget.onEdit,
            obscureText: obscureText,
            maxLines: widget.maxLines ?? 1,
            controller: widget.textController,
            keyboardType: widget.keyboardType,
            style: Theme.of(context).textTheme.bodyMedium,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: obscureText
                          ? const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 15,
                            )
                          : const Icon(
                              CupertinoIcons.eye_slash_fill,
                              size: 15,
                            ),
                    )
                  : widget.suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              filled: Theme.of(context).brightness == Brightness.light
                  ? true
                  : false,
              hintText: widget.label,
              suffixIconColor: widget.channelColor,
              hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.grey,
                  ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          if (widget.displayErrorMessage)
            Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Verify input value',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.red[400],
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

class CommonTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;

  const CommonTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.suffixIcon, this.readOnly = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        10.verticalSpacing,
        TextField(
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}

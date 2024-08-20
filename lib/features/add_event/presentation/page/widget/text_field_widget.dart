import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/utils/app_utils.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final int textFieldLines;
  final Widget? icon;
  final Function()? onTap;
  final bool? onlyRead;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.title,
    this.textFieldLines = 1,
    this.icon,
    this.onlyRead,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.textFieldTitle,
        ),
        AppUtils.kBoxHeight4,
        TextField(
          onTap: onTap,
          readOnly: onlyRead ?? false,
          maxLines: textFieldLines,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: icon,
          ),
        )
      ],
    );
  }
}

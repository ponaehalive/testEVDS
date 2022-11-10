import 'package:flutter/material.dart';
import 'package:test1011/themes/app_colors.dart';
import 'package:test1011/themes/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.onChanged,
    required this.obscureText,
    this.icon,
  });

  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyles.labelStyle,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          onChanged: onChanged,
          cursorColor: AppColors.mainBlack,
          style: TextStyles.labelStyle.copyWith(
            color: AppColors.mainBlack,
          ),
          decoration: InputDecoration(
            iconColor: AppColors.hide,
            suffixIcon: icon,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainBlack),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainBlack),
            ),
          ),
        ),
      ],
    );
  }
}

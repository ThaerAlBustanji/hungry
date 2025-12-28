import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/api_colors.dart';
import '../../../shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({super.key, this.onTab, required this.text});
   final Function() ? onTab;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTab,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(child: CustomText(
          text: text,
          size: 15,
          weight: FontWeight.w700,
          color: AppColors.primary,
        )),
      ),
    );
  }
}

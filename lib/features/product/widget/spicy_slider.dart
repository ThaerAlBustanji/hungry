
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/api_colors.dart';
import '../../../shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
  final double value ;
  final ValueChanged<double> onChanged ;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Image.asset("Assets/image/sandwich.png",height: 250,),
        Spacer(),
        Column(
          children: [
            CustomText(text: "Customize Your Burger\n to Your Tastes.\n Ultimate Experience"),
            Slider(
                min: 0,
                max: 1,
                activeColor: AppColors.primary,
                inactiveColor: Colors.grey.shade200,
                value: widget.value,
                onChanged: widget.onChanged
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "🥶️"),
                Gap(100),
                CustomText(text: "🌶"),
              ],
            )
          ],
        )
      ],
    );
  }
}

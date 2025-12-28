import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/api_colors.dart';
import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(color: AppColors.primary,"Assets/image/logo.svg",height: 35,),
            Gap(5),
            CustomText(text: "Hello,Thaer",size: 16,weight: FontWeight.w500,color: Colors.grey.shade600,),
          ],
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.primary,
          radius: 35,
        child: Icon(CupertinoIcons.person,color: Colors.white,),)
      ],
    );
  }
}

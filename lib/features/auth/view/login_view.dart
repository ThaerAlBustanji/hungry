import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/api_colors.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_txtfield.dart';

import '../widgets/custom_btn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
   final  TextEditingController emailController = TextEditingController();
   final TextEditingController passController = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey();


    return GestureDetector(
      onTap: ()=>{FocusScope.of(context).unfocus()},
      child: Scaffold(
        backgroundColor:  AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset("Assets/image/logo.svg"),
                  Gap(20),
                  CustomText(
                      text: "Welcome back , Discover fast food ",
                      color: Colors.white,
                      weight: FontWeight.w500,
                      size: 13),
                  Gap(70),
                  CustomTxtfield(hint: "Email ",
                    isPassword: false,
                    controller:emailController ,),
                  Gap(20),
                  CustomTxtfield(hint: "Password",
                      isPassword: true,
                      controller: passController),
                  Gap(25),
                  CustomAuthBtn(
                    text: "Login",
                    onTab: (){
                      if(formKey.currentState!.validate()){
                        print("success Login");
                      }
                    },),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}

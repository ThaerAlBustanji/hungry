import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/api_colors.dart';
import 'package:hungry/features/auth/widgets/custom_btn.dart';

import '../../../shared/custom_text.dart';
import '../../../shared/custom_txtfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset("Assets/image/logo.svg"),
                  Gap(70),
                  CustomTxtfield(hint: "Name ",
                    isPassword: false,
                    controller:nameController ,),
                  Gap(15),
                  CustomTxtfield(hint: "Email ",
                    isPassword: false,
                    controller:emailController ,),
                  Gap(15),
                  CustomTxtfield(hint: "Password ",
                    isPassword: true,
                    controller:passwordController ,),
                  Gap(15),
                  CustomTxtfield(hint: "Confirm Password",
                    isPassword: true,
                    controller:confirmPasswordController ,),
                  Gap(25),
                  CustomAuthBtn(
                    text: "Sign",
                    onTab: (){
                    if(formKey.currentState!.validate()){
                      print("success register");
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

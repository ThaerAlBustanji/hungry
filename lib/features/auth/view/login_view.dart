import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/api_colors.dart';
import 'package:hungry/features/auth/view/signup_view.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_field.dart';

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
        backgroundColor:  Colors.white,
        body: Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(230),
                  SvgPicture.asset("Assets/image/logo.svg",color: AppColors.primary,),
                  CustomText(text: "Welcome back , Discover The Fast food ", weight: FontWeight.bold, size: 15),
                  Gap(70),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: AppColors.primary
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Gap(30),
                            CustomTextField(hint: "Email ",
                              isPassword: false,
                              controller:emailController ,),
                            Gap(20),
                            CustomTextField(
                        
                                hint: "Password",
                                isPassword: true,
                                controller: passController),
                            Gap(25),
                            //Login
                            CustomAuthBtn(
                              color: AppColors.primary,
                              textColor: Colors.white,
                              text: "Login",
                              onTab: (){
                                if(formKey.currentState!.validate()){
                                  print("success Login");
                                }
                              },),
                            Gap(30),
                            // Create Account
                            CustomAuthBtn(
                              text: "Create Account?",
                              onTab: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupView()));
                                },),
                            Gap(20),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Root()));
                                },
                                child: CustomText(text: "Continuo as a gust?",
                                  size: 12,
                                  color: Colors.white,
                                  weight: FontWeight.bold,)),
                            Gap(200)
                          ],
                        ),
                      ),
                    ),
                  )
                ],

              ),
            ),
          ),
    );
  }
}

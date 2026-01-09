import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/api_colors.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/auth/widgets/custom_btn.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../shared/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
              key: formKey,
              child: Column(
                  children: [
                    Gap(230),
                    SvgPicture.asset("Assets/image/logo.svg",color: AppColors.primary,),
                    CustomText(text: "Welcome To Our App Food ",weight: FontWeight.bold,size: 15,),
                    Gap(70),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                          ),
                          color: AppColors.primary
                        ),    
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Gap(30),
                              CustomTextField(hint: "Name ",
                                isPassword: false,
                                controller:nameController ,),
                              Gap(15),
                              CustomTextField(hint: "Email ",
                                isPassword: false,
                                controller:emailController ,),
                              Gap(15),
                              CustomTextField(hint: "Password ",
                                isPassword: true,
                                controller:passwordController ,),
                              Gap(25),
                              // sign
                              CustomAuthBtn(
                                color: AppColors.primary,
                                textColor: Colors.white,
                                text: "Sign",
                                onTab: (){
                                  if(formKey.currentState!.validate()){
                                  }
                                },),
                              // login
                              Gap(30),
                              CustomAuthBtn(
                                text: "Go to Login ?",
                                onTab: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                                },),
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

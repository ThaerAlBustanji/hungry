import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/api_colors.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/auth/widgets/custom_user_text_field.dart';
import 'package:hungry/shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late String selectedMethode = "Cash";
  final TextEditingController _name=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _address=TextEditingController();
  @override
  void initState() {
    _name.text="User Name";
    _email.text="user@example.come";
    _address.text="Amman,Joradan";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
         bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 70,
          decoration: BoxDecoration(
        color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                },
                child: Container(
                height: 50,
                 width: 130,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 2
                    )
                
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "log out",color: Colors.white,size: 16,weight: FontWeight.bold,),
                    Gap(10),
                    Icon(Icons.logout,color: Colors.white),
                  ],
                )
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                  
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                 height: 50,
                 width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2
                    )
                
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Edit",color: AppColors.primary,size: 16,weight: FontWeight.bold,),
                    Gap(10),
                    Icon(Icons.edit,color: AppColors.primary,size: 20,),
                  ],
                )
                ),
              )
            ],
          ),
        ),
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          actions: [
             Icon(Icons.settings,color: Colors.white,),
             Gap(10)
          ],
          leading:GestureDetector(
            onTap: (){Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.white,)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("Assets/image/profile_image.png"), fit: BoxFit.cover),
                      color: Colors.grey.shade300,
                      border: Border.all(
                      color: Colors.white,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
                Gap(30),
               CustomUserTextField(
                controller: _name,
                 label: "Name"),
                  Gap(25),
                 CustomUserTextField(
                controller: _email,
                 label: "Email"),
                  Gap(25),
                 CustomUserTextField(
                controller: _address,
                 label: "Address"),
                   Gap(25),
                   Divider(),
                   Gap(30),
                   // visa 
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12)
                    ),
                    tileColor: Colors.white,
                    leading: Image.asset("Assets/icon/visa_icon_blue.png",width: 80,),
                    title: CustomText(text: "Debit card",color: Colors.black,),
                    subtitle:CustomText(text: "**** *** 2345",color: Colors.grey,) ,
                    trailing: CustomText(text: "Default")
                    ),
                    Gap(400)
              ],
            ),
          ),
        ),
      
      ),
    );
  }
}

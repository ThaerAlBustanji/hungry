import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/api_colors.dart';
import 'package:hungry/features/cheekout/widget/order_details_widget.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../shared/custom_button.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late String selectedMethode = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:GestureDetector(
            onTap: (){Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetailsWidget(order: "\$18.19", taxes: "\$1.5", fees: "\$0.3", total: "\$16.48"),
              Gap(80),
              CustomText(text: "Payment methods",size: 20,weight: FontWeight.bold,),
              Gap(10),
              // CASH
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12)
                ),
                tileColor: Color(0xff3C2F2F),
                leading: Image.asset("Assets/icon/cash_icon.png"),
                title: CustomText(text: "Cash on Delivery",color: Colors.white,),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                    value: "Cash",
                    groupValue: selectedMethode,
                    onChanged: (v){
                    setState(() {
                      selectedMethode = v!;
                    });
                    },
                ),
                onTap: (){
                  setState(() {
                    selectedMethode="Cash";
                  });
                },
          
              ),
              Gap(15),
              // Debit
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12)
                ),
                tileColor: Colors.blue.shade900,
                leading: Image.asset("Assets/icon/visa_icon.png",width: 80,),
                title: CustomText(text: "Debit card",color: Colors.white,),
                subtitle:CustomText(text: "**** *** 2345",color: Colors.white,) ,
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value:"Visa",
                  groupValue: selectedMethode,
                  onChanged: (v){
                    setState(() {
                      selectedMethode = v!;
                    });
                  },
                ),
                onTap: (){
                  setState(() {
                    selectedMethode="Visa";
                  });
                },
          
              ),
             Gap(5),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.redAccent,
                      value: true,
                      onChanged: (v){}),
                  CustomText(text: "Save card details for future payments",color: Colors.grey,),
                ],
              )
          
            ],
          ),
        ),
      ),
      bottomSheet:  Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 20,
              offset: Offset(0, 0)
            )
          ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        height: 120,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                CustomText(text: "Total",size: 16,),
                CustomText(text: "\$ 18.7",size: 24,)
              ],
            ),
            CustomButton(text: "Pay Now",
              onTap: (){
              showDialog(context: context,
                  builder: (context){
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 230),
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade800,
                                  blurRadius: 20,
                                  offset: Offset(0, 0)
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.primary,
                              radius: 40,
                              child: Icon(CupertinoIcons.checkmark,size: 40,color: Colors.white,),
                            ),
                            Gap(10),
                            CustomText(text: "Success !",
                              size: 20,
                              color: AppColors.primary,
                              weight: FontWeight.bold,),
                            CustomText(text: "Your payment was successful.\n"
                                "A receipt for this purchase has\n"
                                " been sent to your email.",
                              color: Colors.grey,
                            ),
                            Gap(30),
                            CustomButton(text: "Go Back",width: 200,onTap: (){Navigator.pop(context);},)
                            
                          ],
                        )
                    ),
                  ),
                );
                  });
              },)
          ],
        ),
      ),

    );
  }
}


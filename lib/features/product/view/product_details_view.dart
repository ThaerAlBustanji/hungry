import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/api_colors.dart';
import 'package:hungry/features/product/widget/spicy_slider.dart';
import 'package:hungry/features/product/widget/topping_card.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';


class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;
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
        padding:  EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SpicySlider(value: value, onChanged: (v){
              setState(()=> value = v);
            }),
              Gap(20),
              CustomText(text: "Topping",size: 20,),
              Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children:List.generate(6, (index){
                    return   Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: ToppingCard(imageUrl: "Assets/test/tomato.png",
                          title: "Tomato"
                          , onAdd: (){}),
                    );
                  }),
                ),
              ),
              Gap(50),
              CustomText(text: "Side options",size: 20,),
              Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children:List.generate(6, (index){
                    return   Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: ToppingCard(imageUrl: "Assets/test/tomato.png",
                          title: "Tomato"
                          , onAdd: (){}),
                    );
                  }),
                ),
              ),
              Gap(30),
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
            CustomButton(text: "Add to cart",
              onTap: (){  
                Navigator.pop(context);
                })
          
          ],
        ),
      ),


    );
  }
}

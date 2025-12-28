import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_button.dart';

import '../../../shared/custom_text.dart';

class OderHistoryView extends StatelessWidget {
  const OderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 120,top: 30),
              itemCount: 4,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("Assets/test/test.png",width: 100,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text:"Hamburger" ,weight: FontWeight.bold,),
                                CustomText(text:"Qty: x3" ),
                                CustomText(text:"price: 12\$" )
                              ],
                            ),
                          ],
                        ),
                        Gap(20),
                        CustomButton(text: "Order Again",width: double.infinity,color: Colors.grey.shade400,)
                      ],
                    ),

                  ),
                );
              })
      ),

    );
  }
}

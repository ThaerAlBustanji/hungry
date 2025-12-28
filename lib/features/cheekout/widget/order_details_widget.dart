import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../shared/custom_text.dart';
class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key, required this.order, required this.taxes, required this.fees, required this.total});
  final String order,taxes, fees ,total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Order Summary",size: 20,weight: FontWeight.bold,),
        Gap(10),
        checkOut("order", order,false,false),
        Gap(10),
        checkOut("Taxes", taxes,false,false),
        Gap(10),
        checkOut("Delivery fees", fees,false,false),
        Divider(),
        Gap(10),
        checkOut("Total:", total,true,false),
        Gap(10),
        checkOut("Estimated delivery time:", "15 - 30 mins",true,true),
      ],
    );
  }
}
Widget checkOut(title , price ,isBold,isSmall){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: title,
        size:isSmall?13: 15,
        weight:isBold?FontWeight.bold :FontWeight.w400,
        color: isBold?Colors.black:Colors.grey.shade600,),
      CustomText
        (text: "$price",
        size:isSmall?13: 15,
        weight:isBold?FontWeight.bold: FontWeight.w400,
        color: isBold?Colors.black:Colors.grey.shade600,),
    ],
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/api_colors.dart';
import '../../../shared/custom_text.dart';

class FoodCategory extends StatefulWidget {
    const FoodCategory({super.key, required this.category, required this.selectedIndex});
  final List  category ;
   final int selectedIndex;

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  late int selectedIndex;
  @override
  void initState() {
   selectedIndex=widget.selectedIndex;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.category.length,
          itemBuilder: (context,index){
            return  GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selectedIndex == index?
                  AppColors.primary:Color(0xffF3F4F6),
                ),
                child: CustomText(text: widget.category[index],
                  color: selectedIndex ==index ?
                  Colors.white:Colors.grey.shade700,
                  weight: FontWeight.w500,
                ),
              ),
            );

          }),
    );
  }
}

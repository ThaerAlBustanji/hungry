import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/api_colors.dart';
import '../../../shared/custom_text.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    required this.rate}
      );
  final String image , text , desc, rate ;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isFavorite= false;
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(widget.image,width: 120,height: 120,)),
            Gap(20),
            CustomText(text: widget.text,weight: FontWeight.bold,),
            CustomText(text: widget.desc),
            Row(
              children: [
                CustomText(text: widget.rate),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isFavorite =!isFavorite;
                    });
                  },
                  child: Icon(CupertinoIcons.heart_fill,color: isFavorite? AppColors.primary:Colors.grey,))
              ],
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:hungry/features/cart/widget/cart_item.dart';
import 'package:hungry/features/cheekout/view/checkout_view.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';


class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int  itemCount =20;
  late List <int>quantities ;
  @override
  void initState() {
    super.initState();
  quantities =  List.generate(itemCount, (_)=>1);

  }

  void onAdd(int index){
    setState(() {
      quantities[index]++;
    });
  }
  void onMin(int index){
   setState(() {
     if(quantities[index]>1){
       quantities[index]--;
     }
  });
  }

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
          itemCount: itemCount,
            itemBuilder: (context,index){
              return CartItem(image: "Assets/test/test.png",
                text:"Hamburger" ,
                desc: "Veggie Burger",
                onAdd: ()=>onAdd(index),
                onMin: ()=>onMin(index),
                number: quantities[index],);
            })
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
           topLeft: Radius.circular(30),
           topRight: Radius.circular(30)
         )
       ),
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        height: 90,
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
           CustomButton(text: "Check out",
             onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutView()));
             },)
          ],
        ),
      ),
    );
  }
}

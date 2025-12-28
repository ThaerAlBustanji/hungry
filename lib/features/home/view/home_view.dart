import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/widget/card_item.dart';
import 'package:hungry/features/home/widget/food_category.dart';
import 'package:hungry/features/home/widget/search_field.dart';
import 'package:hungry/features/home/widget/user_header.dart';
import 'package:hungry/features/product/view/product_details_view.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = [
   "All" ,
    "Combos",
    "Sliders",
    "Classic"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: CustomScrollView(
      slivers: [
        //App bar
        SliverAppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          elevation: 0,
          toolbarHeight: 170,
          automaticallyImplyLeading: false,
          pinned: true,
          floating: false,
          flexibleSpace: Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 50),
            child: Column(
              children: [
                UserHeader(),
                Gap(20),
                SearchField(),
              ],
              
            ),
          
          ),
        ),
        // category
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:15 ),
            child: FoodCategory(category: category, selectedIndex: selectedIndex)
            ),
          ),
        // Grid view
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 6,
                  (context,index)=> GestureDetector(
                    onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsView()))},
                    child: CardItem(image: "Assets/test/test.png",
                        text: "Cheeseburger",
                        desc: "Cheeseburger",
                        rate: "4.2"),
                  )
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 0.71,
                crossAxisSpacing: 4
              )),

        ),



         ],
        )

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hungry/core/constants/api_colors.dart';
import 'package:hungry/features/auth/view/profile_view.dart';
import 'package:hungry/features/cart/view/cart_view.dart';
import 'package:hungry/features/home/view/home_view.dart';

import 'features/orderHistory/view/oder_history_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller ;
  late List <Widget> screens ;
  int currentScreen = 0;
  @override
  void initState() {
    screens =[
      HomeView(),
      CartView(),
      OderHistoryView(),
      ProfileView()
      ];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar:
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:  AppColors.primary,
          borderRadius: BorderRadius.circular(16)

        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: currentScreen,
            onTap: (index){
           setState(() {
             currentScreen = index ;
             controller.jumpToPage(currentScreen);
           });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.local_restaurant),label: "Order History"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),

            ]),
      ),

    );
  }
}

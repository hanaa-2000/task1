import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:task1/book_app/screens/category.dart';
import 'package:task1/book_app/screens/home_screen.dart';

class MainScreen  extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages=[
    const HomeScreen(),
    const CategoryScreen(),
  ];
  int index =0;
  int cuIndex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
       bottomNavigationBar: CurvedNavigationBar(
         onTap: (value) {
           setState(() {
             index=value;
           });
         },
         color: Colors.black26,
         buttonBackgroundColor: Colors.black,
         backgroundColor: Colors.white,
           items:const [
             Icon(Icons.home_outlined , color: Colors.white,),
             Icon(Icons.category_outlined , color: Colors.white,),
           ],
      
       ),
        body: pages[index],
      
      
      ),
    );
  }
}

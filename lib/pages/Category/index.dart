import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

//http://10.255.0.19/drcom/login?callback=dr1003&DDDDD=2025305363%40unicom&upass=Zy660088&0MKKey=123456&R1=0&R3=0&R6=0&para=00&v6ip=&v=2381
class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "分类",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}

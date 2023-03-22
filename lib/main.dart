import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Screen/Home/HomePageProvider/HomePageProvider.dart';
import 'package:untitled2/Screen/Home/View/HomePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    ),
  );
}

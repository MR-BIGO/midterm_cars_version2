import 'package:flutter/material.dart';
import 'data/repository/screen_barrel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) =>  HomeScreen(),
         '/editscreen': (context) =>  EditScreen(),
         '/addscreen': (context) =>  AddScreen(),
         '/details': (context) =>  const DetailsScreen(),
      },
      title: "Cars",
      
      
    );
    
  }
}

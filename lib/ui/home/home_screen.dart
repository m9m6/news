import 'package:flutter/material.dart';
import 'package:news/ui/home/category_details/category_details.dart';

class HomeScreen extends StatelessWidget {
  static const String homeRouteName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: CategoryDetails(),
    );
  }
}

/*
8826a2d0afc1436eb897d424f149b419
*/
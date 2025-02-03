import 'package:elevate_intake2_intro/di/injectibleInitializer.dart';
import 'package:elevate_intake2_intro/ui/home/HomeViewModel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // field injection
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>(); // fieldInjection //whatever
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
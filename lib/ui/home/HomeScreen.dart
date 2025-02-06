import 'package:elevate_intake2_intro/di/injectibleInitializer.dart';
import 'package:elevate_intake2_intro/ui/home/HomeViewModel.dart';
import 'package:elevate_intake2_intro/ui/home/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // field injection
  // public

  HomeViewModel homeViewModel = getIt.get<HomeViewModel>(); // fieldInjection //whatever

  void setHomViewModel(HomeViewModel viewModel) {
    // run time error
    this.homeViewModel = viewModel;
  }

  @override
  void initState() {
    super.initState();
    homeViewModel.getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // BlockPRovider
      create: (context) => homeViewModel,
      child: Scaffold(
        body: Consumer<HomeViewModel>(builder:(context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case LoadingState():{
              return BuildHomeLoading();
            }
            case SuccessState():{
              return BuildHomeSuccess();
            }
            case ErrorState():{
              return BuildHomeError();
            }
          }
        },)
      ),
    );
  }


  Widget BuildHomeSuccess(){
    return Center(
      child: Text("Success"),
    );
  }

  Widget BuildHomeLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget BuildHomeError(){
    return Center(
      child: Text("Error"),
    );
  }

}
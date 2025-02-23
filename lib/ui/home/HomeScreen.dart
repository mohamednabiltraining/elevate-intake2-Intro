import 'package:elevate_intake2_intro/di/injectibleInitializer.dart';
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:elevate_intake2_intro/ui/home/HomeViewModel.dart';
import 'package:elevate_intake2_intro/ui/home/home_screen_state.dart';
import 'package:elevate_intake2_intro/ui/utils/ErrorMessageHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    homeViewModel.doIntent(LoadHomePageIntent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider( // cubit
      create: (context) => homeViewModel,
      child: Scaffold(
        body: BlocBuilder<HomeViewModel, HomeScreenState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.loading:{
                return BuildHomeLoading();
              }
              case Status.success:{
                return BuildHomeSuccess(state);
              }
              case Status.error:{
                return BuildHomeError(state);
              }
            }
          },
        )
      ),
    );
  }


  Widget BuildHomeSuccess(HomeScreenState state){
    return Column(
      children: [
        Expanded(child: HomeCategories(state.categories)),
        Expanded(child: HomeBrands(state.brands)),
      ],
    );
  }

  Widget BuildHomeLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget BuildHomeError(HomeScreenState state){
    return Center(
      child: Text(
          extractErrorMessage(state.exception,context)
      ),
    );
  }

}

class HomeCategories extends StatelessWidget {
  List<Category> ? categories;
  HomeCategories(this.categories);
  @override
  Widget build(BuildContext context) {
    var viewModel=  BlocProvider.of<HomeViewModel>(context);
    return ListView.builder(itemBuilder: (context, index) {
      return InkWell(
          onTap: () {
            viewModel.doIntent(
              CategoryClickIntent(categories?[index])
            );

          },
          child: Text(categories?[index].name ?? ""));
    },
    itemCount: categories?.length ?? 0,
    );
  }
}
class HomeBrands extends StatelessWidget {
  List<Brand> ? brands;
  HomeBrands (this.brands);
  @override
  Widget build(BuildContext context) {
   var viewModel=  BlocProvider.of<HomeViewModel>(context);
   // var viewModel =  context.read<HomeViewModel>();
    return ListView.builder(itemBuilder: (context, index) {
      return InkWell(
          onTap: () {
            // call viewModel
            viewModel.doIntent(
                BrandClickIntent(brands?[index])
            );

          },
          child: Text(brands?[index].name ?? ""));
    },
    itemCount: brands?.length ?? 0,
    );
  }
}
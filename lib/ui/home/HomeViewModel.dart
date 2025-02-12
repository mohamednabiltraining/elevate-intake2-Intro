import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:elevate_intake2_intro/domain/usecase/get_brands_use_case.dart';
import 'package:elevate_intake2_intro/domain/usecase/get_categories_use_case.dart';
import 'package:elevate_intake2_intro/ui/home/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class HomeViewModel extends Cubit<HomeScreenState>{

  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;

   HomeViewModel(this.getCategoriesUseCase,this.getBrandsUseCase) : super(HomeScreenState(status: Status.loading));


   void doIntent(HomeIntent homeIntent){
     switch(homeIntent){
       case CategoryClickIntent():{
         _categoryClicked(homeIntent.category);
       }
       case BrandClickIntent():{
         _brandClicked(homeIntent.brand);
       }
       case LoadHomePageIntent():{
         _loadHomePage();
       }
     }
   }

   void _loadHomePage(){
     _getCategories();
     _getBrands();
   }

   void _getCategories()async {
     emit(state.copyWith(
         status: Status.loading
     ));
     var result = await getCategoriesUseCase.invoke();
     switch(result){
       case Success():{
         emit(state.copyWith(
             status: Status.success,
             categories: result.data
         ));
       }
       case Error():{
         emit(state.copyWith(
             status: Status.error,
             exception: result.exception
         ));
       }
     }

   }
   void _getBrands()async {
     emit(state.copyWith(
         status: Status.loading
     ));
     var result = await getBrandsUseCase.invoke();
     switch (result) {
       case Success():
         {
           emit(state.copyWith(
               status: Status.success,
               brands: result.data
           ));
         }
       case Error():
         {
           emit(state.copyWith(
               status: Status.error,
               exception: result.exception
           ));
         }
     }
   }
  void _categoryClicked(Category? category) {
    // logic
    // Tracking
    // Analytics
  }
  void _brandClicked(Brand? brand) {
     // logic
    // Tracking
  }



}
sealed class HomeIntent{}
class CategoryClickIntent extends HomeIntent{
  Category? category;
  CategoryClickIntent(this.category);
}
class BrandClickIntent extends HomeIntent{
  Brand? brand;
  BrandClickIntent(this.brand);
}
class LoadHomePageIntent extends HomeIntent{}
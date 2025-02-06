import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:elevate_intake2_intro/domain/usecase/get_categories_use_case.dart';
import 'package:elevate_intake2_intro/ui/home/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@injectable
class HomeViewModel extends ChangeNotifier{

   GetCategoriesUseCase getCategoriesUseCase;

   HomeViewModel(this.getCategoriesUseCase);

   HomeScreenState state = LoadingState();
   SuccessState successState = SuccessState();

   void getCategories()async {
     try{
       // loading
       emitState(LoadingState());
       var cats = await getCategoriesUseCase.invoke();
       // success
       emitState(SuccessState(
         cats =  cats
       ));
     }on Exception catch(ex){
       // error
       emitState(ErrorState(ex));
     }
   }

   void emitState(HomeScreenState state){
     this.state = state;
     notifyListeners();
   }
}
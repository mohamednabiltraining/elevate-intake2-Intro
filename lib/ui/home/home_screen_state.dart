
import 'package:elevate_intake2_intro/domain/model/category.dart';

sealed class HomeScreenState {}
class SuccessState extends HomeScreenState {
    List<Category>? categories ;
    SuccessState([this.categories]);
}
class LoadingState extends HomeScreenState {
  String? loadingMessage;
  LoadingState([this.loadingMessage]);
}
class ErrorState extends HomeScreenState {
  Exception? exception;
  ErrorState([this.exception]);
}
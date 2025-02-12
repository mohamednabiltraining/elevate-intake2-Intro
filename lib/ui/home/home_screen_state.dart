
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:equatable/equatable.dart';

enum Status{
  loading,
  success,
  error
}
class HomeScreenState extends Equatable{
  Status status;
  String? loadingMessage;
  Exception? exception;
  List<Category>? categories ;
  List<Brand>? brands ;
  String? navigationRoute;

  HomeScreenState({
    required this.status,
    this.loadingMessage,
    this.exception,
    this.categories,
    this.brands});

  HomeScreenState copyWith({
    Status? status,
    String? loadingMessage,
    Exception? exception,
    List<Category>? categories,
  List<Brand>? brands}){
    return HomeScreenState(
      status: status ?? this.status,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      exception: exception ?? this.exception,
      categories: categories ?? this.categories,
      brands: brands ?? this.brands,
    );
  }

  @override
  List<Object?> get props => [status,categories,loadingMessage,exception,
  brands];

}

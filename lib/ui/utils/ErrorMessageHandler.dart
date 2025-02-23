import 'package:elevate_intake2_intro/domain/common/exceptions/ServerError.dart';
import 'package:flutter/cupertino.dart';

/// this function takes [ex] and extract error message
/// from exception
/// [context] is optional
/// if [context] is sent then it will used for translation
String extractErrorMessage(Exception? ex,BuildContext? context){
  String? message = "";
  switch(ex){
    case ServerError():{
      message = ex.errorModel?.message;
  }
    case ClientError():{
      message = ex.errorModel?.message;
  }
    case NetworkError():{
      message = "NetworkError";//.tr();
    }
    default:{
      message = "GeneralErrorMessage";//.tr();

    }
  }
 return message!;
}
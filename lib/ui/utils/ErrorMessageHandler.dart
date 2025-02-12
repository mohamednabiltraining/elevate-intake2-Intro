import 'package:elevate_intake2_intro/domain/common/exceptions/ServerError.dart';
import 'package:flutter/cupertino.dart';

String handleErrorMessage(Exception? ex,BuildContext context){
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
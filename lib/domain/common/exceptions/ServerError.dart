import 'package:elevate_intake2_intro/domain/model/ErrorModel.dart';

class ServerError implements Exception{
  ErrorModel? errorModel;
  ServerError(this.errorModel);
}

class NetworkError implements Exception {
  NetworkError();
}

class ClientError implements Exception {
  ErrorModel? errorModel;
  ClientError(this.errorModel);
}

class ServerSideError implements Exception {
  ErrorModel? errorModel;
  ServerSideError(this.errorModel);
}
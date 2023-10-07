import 'package:bookly/core/network_error/error_massage_model.dart';

class ServerException implements Exception{
  final ErrorMassageModel errorMassageModel;
  const ServerException({required this.errorMassageModel});

}
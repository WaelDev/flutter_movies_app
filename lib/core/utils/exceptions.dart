import '../network/error_message_model.dart';

class ServerException {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class DatabaseException {
  final ErrorMessageModel errorMessageModel;

  DatabaseException({required this.errorMessageModel});
}

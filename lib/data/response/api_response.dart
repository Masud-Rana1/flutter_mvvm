import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? Data;
  String? message;
  ApiResponse([this.status, this.message, this.Data]);
  ApiResponse.Loading() : status = Status.LOADING;
  ApiResponse.Completed() : status = Status.COMPLETED;
  ApiResponse.Error() : status = Status.ERROR;
  @override
  String toString() {
    return "status: $status\n data: $Data\n message: $message";
  }
}

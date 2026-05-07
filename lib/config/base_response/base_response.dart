sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T>{
  T? data;
  String? message;
  String? token;
  SuccessBaseResponse({required this.data,this.message,this.token});
}

class ErrorBaseResponse<T> extends BaseResponse<T>{
  String message;
  int code;
  ErrorBaseResponse({required this.message,required this.code});
}
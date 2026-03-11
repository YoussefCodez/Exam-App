sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T>{
  T data;
  SuccessBaseResponse({required this.data});
}

class ErrorBaseResponse<T> extends BaseResponse<T>{
  String message;
  int code;
  ErrorBaseResponse({required this.message,required this.code});
}
sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T>{

  String message;
  String token;
  T user;
  SuccessBaseResponse({required this.message,required this.token,required this.user});
}

class ErrorBaseResponse<T> extends BaseResponse<T>{
  String message;
  int code;
  ErrorBaseResponse({required this.message,required this.code});
}
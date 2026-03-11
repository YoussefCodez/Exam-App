sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse{

  String message;
  String token;
  T user;
  SuccessBaseResponse({required this.message,required this.token,required this.user});
}

class ErrorBaseResponse<T> extends BaseResponse{
  String message;
  int code;
  ErrorBaseResponse({required this.message,required this.code});
}
sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse{

  String message;
  String token;
  T user;
  SuccessBaseResponse(this.message,this.token,this.user);

}

class ErrorBaseResponse<T> extends BaseResponse{
  String message;
  int code;
  ErrorBaseResponse(this.message,this.code);
}
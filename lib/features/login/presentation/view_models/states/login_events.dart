sealed class LoginEvents {}

class ToggleRememberMe extends LoginEvents {}

class Login extends LoginEvents {}

class LoadSavedAccount extends LoginEvents {}

class GetSavedEmail extends LoginEvents {}

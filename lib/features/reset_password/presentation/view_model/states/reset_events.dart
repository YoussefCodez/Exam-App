sealed class ResetEvents {}

class ForgotPasswordEvent extends ResetEvents {}

class VerifyResetCodeEvent extends ResetEvents {}

class NewpasswordEvent extends ResetEvents {}

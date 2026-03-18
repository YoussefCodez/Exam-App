import 'package:exam/features/sign_up/domain/entities/user_created.dart';

sealed class SignupEvents {}

class AddUserEvent extends SignupEvents {}
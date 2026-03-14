import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/sign_up/domain/entities/user.dart';
import 'package:exam/features/sign_up/domain/entities/user_created.dart';
import 'package:exam/features/sign_up/presentation/view_model/states/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/signup_use_case.dart';

@injectable
class SignupViewModel extends Cubit<SignupStates>{
  final SignupUseCase callSignupUseCase;
  SignupViewModel(this.callSignupUseCase) : super(SignupInitial());

  Future<void> addUser() async {
    emit(SignupLoading());

    final response = await callSignupUseCase.signUp(UserCreated(
        email: "abdelrahmanobo12@gmail.com",
        firstName: "Abdelrahman",
        lastName: "Ahmed",
        password: "123456",
        phone: "010222449406",
        rePassword: "123456",
        username: "@ayoubo3"));

    print('ViewModel user : ${response}'); // 👈 here

    switch (response){

      case SuccessBaseResponse<User>():
        emit(SignupSuccess(response.data));
        print("Sucessssssssssss");

      case ErrorBaseResponse<User>():
        emit(SignupError(response.message));
        print("Failureeeeeeeee");
    }
  }
}

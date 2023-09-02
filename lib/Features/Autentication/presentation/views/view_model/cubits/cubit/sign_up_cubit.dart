import 'package:bloc/bloc.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/view_model/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  signUP(String email, String password) {
    emit(SignUpLoading());
    try {
      AuthUsingFirebase().signup(email, password);
      emit(SignUpSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(SignUpFailed(errmessage: e.code));
      } else {
        emit(SignUpFailed(errmessage: "There is an error, Please try again "));
      }
    }
  }
}

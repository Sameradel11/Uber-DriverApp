import 'package:bloc/bloc.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/view_model/services.dart';
import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  signUP(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(SignUpLoading());
    try {
      await AuthUsingFirebase()
          .signup(email: email, password: password, name: name, phone: phone);
      emit(SignUpSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(SignUpFailed(errmessage: e.code));
      } else {
        emit(SignUpFailed(errmessage: "There is an error, Please try again "));
      }
    }
  }

  savecarfetails({required Map<String, String> cardetails}) {
    try {
      emit(SignUpLoading());
      DatabaseReference driversreference =
          FirebaseDatabase.instance.ref().child("drivers");
      driversreference
          .child(currentfirebaseuser!.uid)
          .child("car_details")
          .set(cardetails);
      emit(SignUpSuccess());
    } catch (e) {
      if (e is FirebaseException || e is FirebaseAuthException) {
        emit(SignUpFailed(errmessage: e.toString()));
      } else {
        emit(SignUpFailed(errmessage: "There is an error"));
      }
    }
  }
}

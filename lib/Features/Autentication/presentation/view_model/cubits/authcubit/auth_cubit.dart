import 'package:bloc/bloc.dart';
import 'package:drivers_app/Features/Autentication/presentation/view_model/services.dart';
import 'package:drivers_app/core/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  signUP(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(AuthLoading());
    try {
      await AuthUsingFirebase()
          .signup(email: email, password: password, name: name, phone: phone);
      emit(AuthSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(AuthFailed(errmessage: e.code));
      } else {
        emit(AuthFailed(errmessage: "There is an error, Please try again "));
      }
    }
  }

  savecardetails({required Map<String, String> cardetails}) {
    try {
      emit(AuthLoading());
      DatabaseReference driversreference =
          FirebaseDatabase.instance.ref().child("drivers");
      driversreference
          .child(currentfirebaseuser!.uid)
          .child("car_details")
          .set(cardetails);
      emit(AuthSuccess());
    } catch (e) {
      if (e is FirebaseException || e is FirebaseAuthException) {
        emit(AuthFailed(errmessage: e.toString()));
      } else {
        emit(AuthFailed(errmessage: "There is an error"));
      }
    }
  }

  signout() {
    try {
      emit(AuthLoading());
      firebaseAuth.signOut();
      emit(AuthSuccess());
    } catch (e) {
      if (e is FirebaseException || e is FirebaseAuthException) {
        emit(AuthFailed(errmessage: e.toString()));
      } else {
        emit(AuthFailed(errmessage: "There is an error"));
      }
    }
  }

  signin({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      if (e is FirebaseException || e is FirebaseAuthException) {
        emit(AuthFailed(errmessage: e.toString()));
      } else {
        emit(AuthFailed(errmessage: "There is an error"));
      }
    }
  }
}

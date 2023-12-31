import 'package:bloc/bloc.dart';
import 'package:drivers_app/Features/profile/data/driver_model.dart';
import 'package:drivers_app/core/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'fetchuserdata_state.dart';

class FetchuserdataCubit extends Cubit<FetchuserdataState> {
  FetchuserdataCubit() : super(FetchuserdataInitial());
  fetchuserdata() {
    try {
      DatabaseReference usersref = FirebaseDatabase.instance
          .ref()
          .child("drivers")
          .child(firebaseAuth.currentUser!.uid);
      usersref.once().then(
        (snap) {
          UserModel currentuser = UserModel.snapshot(snap.snapshot);
          print("*" * 1000);
          print(currentuser.name);
          print(currentuser.email);
          print(currentuser.phone);

          emit(FetchdataSuccess(user: currentuser));
        },
      );
    } catch (e) {
      print("ERROR" * 12340234);
      if (e is FirebaseException || e is FirebaseDatabase) {
        emit(FetchdataFailed(errmeassge: e.toString()));
      } else {
        emit(FetchdataFailed(
            errmeassge: "There is an error please try again alter"));
      }
    }
  }
}

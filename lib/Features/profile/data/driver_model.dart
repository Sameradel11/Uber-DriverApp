import 'package:firebase_database/firebase_database.dart';

class UserModel {
  final String phone;
  final String name;
  final String id;
  final String email;

  UserModel(
      {required this.phone,
      required this.name,
      required this.id,
      required this.email});

  factory UserModel.snapshot(DataSnapshot snap) {
    final currentsnap = snap.value as dynamic;
    return UserModel(
        phone: currentsnap['phone'],
        name: currentsnap['name'],
        id: snap.key!,
        email: currentsnap['email']);
  }
}
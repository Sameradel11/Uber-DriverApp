part of 'sign_up_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailed extends AuthState {
  final String errmessage;

  AuthFailed({required this.errmessage});
}

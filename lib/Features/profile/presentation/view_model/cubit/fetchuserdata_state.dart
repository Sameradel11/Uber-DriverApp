part of 'fetchuserdata_cubit.dart';

@immutable
sealed class FetchuserdataState {}

final class FetchuserdataInitial extends FetchuserdataState {}
final class FetchdataInitial extends FetchuserdataState {}

final class FetchdataSuccess extends FetchuserdataState {
  final UserModel user;
  FetchdataSuccess({required this.user});
}

final class FetchdataLoading extends FetchuserdataState {}

final class FetchdataFailed extends FetchuserdataState {
  final String errmeassge;

  FetchdataFailed({required this.errmeassge});
}
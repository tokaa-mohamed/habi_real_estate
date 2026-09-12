part of 'profile_page_cubit.dart';

class ProfilePageState {}

class ProfilePageIntialState extends ProfilePageState {}

class ProfilePageLoadingState extends ProfilePageState {}

class GetDataSuccessfulyState extends ProfilePageState {
  final DataOfProfileEntity dataOfUser;

  GetDataSuccessfulyState({required this.dataOfUser});
}

class FailGetDataState extends ProfilePageState {
  final String errorMessege;

  FailGetDataState({required this.errorMessege});
}

class ProfilePageUpdateState extends ProfilePageState {}

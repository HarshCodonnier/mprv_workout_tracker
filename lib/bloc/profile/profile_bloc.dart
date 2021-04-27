import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mprv_workout_tracker/bloc/profile/profile_repo.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeProfileEvent extends ProfileEvent {
  final String firstName;
  final String lastName;
  final String email;
  final File file;

  ChangeProfileEvent(this.firstName, this.lastName, this.email, this.file);
}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;

  ChangePasswordEvent(this.oldPassword, this.newPassword);
}

class LogoutEvent extends ProfileEvent {}

abstract class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileChangesDone extends ProfileState {
  final Map<String, dynamic> _result;

  ProfileChangesDone(this._result);

  Map<String, dynamic> get data => _result;
}

class PasswordLoading extends ProfileState {}

class PasswordChangesDone extends ProfileState {
  final Map<String, dynamic> _result;

  PasswordChangesDone(this._result);

  Map<String, dynamic> get data => _result;
}

class LogoutLoading extends ProfileState {}

class LogoutDone extends ProfileState {
  final Map<String, dynamic> _result;

  LogoutDone(this._result);

  Map<String, dynamic> get data => _result;
}

class InitialProfileState extends ProfileState {}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepo profileRepo;

  ProfileBloc(this.profileRepo) : super(InitialProfileState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    var result = {
      "status": false,
      "message": "Something went wrong.",
      "data": null,
    };
    if (event is ChangeProfileEvent) {
      try {
        yield ProfileLoading();
        result = await profileRepo.uploadImage(
            event.firstName, event.lastName, event.email, event.file);
        yield ProfileChangesDone(result);
      } catch (exception) {
        yield ProfileChangesDone(result);
      }
    } else if (event is ChangePasswordEvent) {
      try {
        yield PasswordLoading();
        result = await profileRepo.changePassword(
            event.oldPassword, event.newPassword);
        yield PasswordChangesDone(result);
      } catch (exception) {
        yield PasswordChangesDone(result);
      }
    } else if (event is LogoutEvent) {
      try {
        yield LogoutLoading();
        result = await profileRepo.logout();
        yield LogoutDone(result);
      } catch (exception) {
        yield LogoutDone(result);
      }
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../bloc/startup/startup_repo.dart';

class StartupEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegistrationEvent extends StartupEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegistrationEvent(this.firstName, this.lastName, this.email, this.password);

  @override
  List<Object> get props => [];
}

class LoginEvent extends StartupEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [];
}

class ForgotPasswordEvent extends StartupEvent {
  final String email;

  ForgotPasswordEvent(this.email);

  @override
  List<Object> get props => [];
}

class VerifyPasswordEvent extends StartupEvent {
  final String email;
  final String verificationCode;
  final String password;

  VerifyPasswordEvent(this.email, this.verificationCode, this.password);

  @override
  List<Object> get props => [];
}

class StartupState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotLoggedInState extends StartupState {}

class StartupLoading extends StartupState {}

class StartupDone extends StartupState {
  final Map<String, dynamic> _result;

  StartupDone(this._result);

  Map<String, dynamic> get data => _result;
}

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  StartupRepo startupRepo;

  StartupBloc(this.startupRepo) : super(NotLoggedInState());

  @override
  Stream<StartupState> mapEventToState(
    StartupEvent event,
  ) async* {
    var result = {
      "status": false,
      "message": "Something went wrong.",
      "data": null,
    };
    yield StartupLoading();
    try {
      if (event is RegistrationEvent) {
        result = await startupRepo.userRegister(
            event.firstName, event.lastName, event.email, event.password);
        yield StartupDone(result);
      } else if (event is LoginEvent) {
        result = await startupRepo.userLogin(event.email, event.password);
        yield StartupDone(result);
      } else if (event is ForgotPasswordEvent) {
        result = await startupRepo.forgotPassword(event.email);
        yield StartupDone(result);
      } else if (event is VerifyPasswordEvent) {
        result = await startupRepo.verificationPassword(
            event.email, event.verificationCode, event.password);
        yield StartupDone(result);
      }
    } catch (exception) {
      yield StartupDone(result);
    }
  }
}

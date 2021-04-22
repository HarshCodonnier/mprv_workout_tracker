import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mprv_workout_tracker/bloc/log/log_repo.dart';
import 'package:mprv_workout_tracker/models/log_item.dart';

abstract class LogEvent extends Equatable {
  const LogEvent();

  @override
  List<Object> get props => [];
}

class AddEditLogEvent extends LogEvent {
  final List<LogItem> logs;
  final bool isEdit;

  AddEditLogEvent(this.logs, this.isEdit);

  @override
  List<Object> get props => [];
}

class GetLogEvent extends LogEvent {
  @override
  List<Object> get props => [];
}

class DeleteLogEvent extends LogEvent {
  final int logId;

  DeleteLogEvent(this.logId);

  @override
  List<Object> get props => [];
}

abstract class LogState extends Equatable {
  const LogState();

  @override
  List<Object> get props => [];
}

class LogNotAdded extends LogState {
  @override
  List<Object> get props => [];
}

class LogLoading extends LogState {
  @override
  List<Object> get props => [];
}

class LogDone extends LogState {
  final Map<String, dynamic> _result;

  LogDone(this._result);

  Map<String, dynamic> get data => _result;
}

class LogDeleted extends LogState {
  final Map<String, dynamic> _result;

  LogDeleted(this._result);

  Map<String, dynamic> get data => _result;
}

class LogBloc extends Bloc<LogEvent, LogState> {
  LogRepo logRepo;

  LogBloc(this.logRepo) : super(LogNotAdded());

  @override
  Stream<LogState> mapEventToState(
    LogEvent event,
  ) async* {
    var result = {
      "status": false,
      "message": "Something went wrong.",
      "data": null,
    };
    yield LogLoading();
    try {
      if (event is AddEditLogEvent) {
        result = await logRepo.addEditLog(event.logs, event.isEdit);
        yield LogDone(result);
      } else if (event is DeleteLogEvent) {
        result = await logRepo.deleteLog(event.logId);
        yield LogDeleted(result);
      } else if (event is GetLogEvent) {
        result = await logRepo.getAllLogs();
        yield LogDone(result);
      }
    } catch (exception) {
      yield LogDone(result);
    }
  }
}

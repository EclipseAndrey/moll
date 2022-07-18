part of 'info_host_bloc.dart';


abstract class InfoHostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InfoHostStartEvent extends InfoHostEvent {
  final String ip;
  InfoHostStartEvent(this.ip);

  @override
  List<Object> get props => [];
}

class InfoHostStopEvent extends InfoHostEvent {
  //TODO add params
  InfoHostStopEvent();

  @override
  List<Object> get props => [];
}
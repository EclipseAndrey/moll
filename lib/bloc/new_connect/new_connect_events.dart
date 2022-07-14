part of 'new_connect_bloc.dart';


abstract class NewConnectEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewConnectSearchEvent extends NewConnectEvent {
  NewConnectSearchEvent();

  @override
  List<Object> get props => [DateTime.now()];
}

class NewConnectStopEvent extends NewConnectEvent {
  //TODO add params
  NewConnectStopEvent();

  @override
  List<Object> get props => [];
}
part of 'scan_bloc.dart';


abstract class ScanEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ScanStartEvent extends ScanEvent {
  ScanStartEvent();

  @override
  List<Object> get props => [];
}

class ScanNewDeviceEvent extends ScanEvent {
  final ActiveHost hostItem;
  ScanNewDeviceEvent({required this.hostItem});

  @override
  List<Object> get props => [hostItem];
}

class ScanStopEvent extends ScanEvent {
  ScanStopEvent();

  @override
  List<Object> get props => [];
}
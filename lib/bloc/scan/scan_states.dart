part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();
}


class ScanEmptyState extends ScanState {
  const ScanEmptyState();

  @override
  List<Object?> get props => [];
}

class ScanLoadingState extends ScanState {
  const ScanLoadingState();

  @override
  List<Object?> get props => [];
}

class ScanResultState extends ScanState {
  final ActiveHost newHost;
  final List<ActiveHost> hosts;
  const ScanResultState({required this.hosts, required this.newHost,});

  ScanResultState addHost(ActiveHost host){
    return ScanResultState(hosts: hosts..add(host), newHost: host);
  }


  @override
  List<Object?> get props => [DateTime.now()];
}

class ScanErrorState extends ScanState {
  final String error;
  const ScanErrorState(this.error);

  @override
  List<Object?> get props => [error];
}



part of 'new_connect_bloc.dart';

abstract class NewConnectState extends Equatable {
  NewConnectState();
}


class NewConnectEmptyState extends NewConnectState {
  NewConnectEmptyState();

  @override
  List<Object?> get props => [];
}

class NewConnectLoadingState extends NewConnectState {
  NewConnectLoadingState();

  @override
  List<Object?> get props => [];
}

class NewConnectResultState extends NewConnectState {
  final List<String> ips;
  NewConnectResultState({required this.ips});

  @override
  List<Object?> get props => [ips];
}

class NewConnectErrorState extends NewConnectState {
  //TODO add params
  NewConnectErrorState();

  @override
  List<Object?> get props => [];
}



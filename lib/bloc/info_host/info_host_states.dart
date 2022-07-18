part of 'info_host_bloc.dart';

abstract class InfoHostState extends Equatable {
  InfoHostState();
}


class InfoHostEmptyState extends InfoHostState {
  //TODO add params
  InfoHostEmptyState();

  @override
  List<Object?> get props => [];
}

class InfoHostLoadingState extends InfoHostState {
  final String name;
  InfoHostLoadingState({required this.name});

  @override
  List<Object?> get props => [name];
}

class InfoHostResultState extends InfoHostState {
  final HostItem host;

  InfoHostResultState({required this.host});

  @override
  List<Object?> get props => [host];
}

class InfoHostErrorState extends InfoHostState {
  final String error;
  InfoHostErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}



import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moll/models/host_item.dart';

part 'info_host_states.dart';

part 'info_host_events.dart';


class InfoHostBloc extends Bloc<InfoHostEvent, InfoHostState> {
  final String blocName = "InfoHostBloc";


  InfoHostBloc() : super(InfoHostEmptyState()) {
    on<InfoHostStartEvent>((event, emit) {
      return startEvent(event, emit);
    });
    on<InfoHostStopEvent>((event, emit) {
      return stopEvent(event, emit);
    });
  }

  Future<void> startEvent(InfoHostStartEvent event, Emitter emit) async {
    emit(InfoHostLoadingState(name: event.ip));
  }

  Future<void> stopEvent(InfoHostStopEvent event, Emitter emit) async {
    emit(InfoHostEmptyState());
  }


}
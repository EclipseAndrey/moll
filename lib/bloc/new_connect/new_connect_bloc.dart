import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_connect_states.dart';

part 'new_connect_events.dart';


class NewConnectBloc extends Bloc<NewConnectEvent, NewConnectState> {
  final String blocName = "NewConnectBloc";


  NewConnectBloc() : super(NewConnectEmptyState()) {
    on<NewConnectSearchEvent>((event, emit) {
      return startEvent(event, emit);
    });
    on<NewConnectStopEvent>((event, emit) {
      return stopEvent(event, emit);
    });
  }

  Future<void> startEvent(NewConnectSearchEvent event, Emitter emit) async {
    emit(NewConnectLoadingState());
    await Future.delayed(const Duration(milliseconds: 5000));
    emit(NewConnectEmptyState());
  }

  Future<void> stopEvent(NewConnectStopEvent event, Emitter emit) async {
    emit(NewConnectEmptyState());
  }


}
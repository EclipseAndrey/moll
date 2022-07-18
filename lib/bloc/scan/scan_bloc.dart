import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moll/models/host_item.dart';
import 'package:moll/repositories/scan_repository/scan_repository_interface.dart';
import 'package:moll/support/crashlytics/crashlytics.dart';
import 'package:moll/scanner/scanner.dart';


part 'scan_states.dart';

part 'scan_events.dart';


class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final String blocName = "ScanBloc";
  final ScanRepositoryInterface scanRepository;

  // Stream<ActiveHost>? searchStream;


  ScanBloc({required this.scanRepository}) : super(ScanEmptyState()) {
    on<ScanStartEvent>((event, emit) {
      return startEvent(event, emit);
    });
    on<ScanStopEvent>((event, emit) {
      return stopEvent(event, emit);
    });
    on<ScanNewDeviceEvent>((event, emit) {
      return newEvent(event, emit);
    });
  }


  bool _research = true;

  Future<void> startEvent(ScanStartEvent event, Emitter emit) async {
    _research = true;
    print("scan open");
    await emit.onEach(scanRepository.getScanStream(), onData: (event){
        if(event is ActiveHost) {
          if(event.pingData.error == null) {
            add(ScanNewDeviceEvent(hostItem: event));
          }
      }
    });
    await Future.delayed(const Duration(milliseconds: 1500));

    print("scan close");
    if(_research){
      add(ScanStartEvent());
    }

    // searchStream?.listen((event) {
    //   if(event.pingData.error == null)
    //   Crashlytics.printLog("New event ${event.ip} ${event.pingData}");
    //   if(state is ScanResultState){
    //     add(ScanNewDeviceEvent(hostItem: HostItem(ip: event.ip)));
    //   }
    // });
  }

  Future<void> newEvent(ScanNewDeviceEvent event, Emitter emit) async {
    if(state is ScanResultState){
      bool find = false;
      (state as ScanResultState).hosts.forEach((element) {if(element.ip == event.hostItem.ip)find = true;});
      if(!find) {
        Crashlytics.printLog("New devise ${event.hostItem.ip}");
        emit((state as ScanResultState).addHost(event.hostItem));
      }
    }else{
      emit(ScanResultState(hosts: [event.hostItem], newHost: event.hostItem));
    }
  }
  Future<void> stopEvent(ScanStopEvent event, Emitter emit) async {
    _research = false;
  }


}
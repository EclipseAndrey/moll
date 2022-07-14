

import 'package:moll/models/analytics/attribution.dart';
import 'package:moll/support/analytic/analytic_panel_interface.dart';

mixin  AnalyticManagerMixin{

  List<AnalPanel> observer = [];

  void addPanel<T extends AnalPanel>(T panel){
    bool can = true;
    for(int i = 0; i < observer.length && can; i++){
      can = !(observer[i] is T);
    }
    if(can) observer.add(panel);
  }

  void removePanel<T>(){
    observer.removeWhere((element) => element is T);
  }
}


class AnalyticManager extends AnalPanel with AnalyticManagerMixin{

  @override
  Future<Attribution> getAttribution<T>() async{
    return await (observer.where((element) => element is T)).first.getAttribution();
  }


  @override
  Future<void> event(String event) async{
    observer.forEach((element)async { await element.event(event);});

  }


  @override
  Future<void> onPause() async{
    observer.forEach((element)async { await element.onPause();});

  }

  @override
  Future<void> onResume() async{
    observer.forEach((element)async { await element.onResume();});

  }


  @override
  Future<void> start() async{
    observer.forEach((element)async { await element.start();});
  }


}

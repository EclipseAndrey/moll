import 'package:moll/models/analytics/attribution.dart';
import 'package:rxdart/rxdart.dart';

abstract class AnalPanel{

  BehaviorSubject<Uri> streamDeepLink = BehaviorSubject<Uri>();

  Future<void> start ();

  Future<void> onResume();

  Future<void> onPause();

  Future<void> event(String event);

  Future<Attribution> getAttribution<T>();

  dispose(){
    streamDeepLink.close();
  }
}

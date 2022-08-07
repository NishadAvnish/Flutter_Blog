import 'dart:async';

enum Event { increment, decrement }

class CounterController {
  int counter = 0;
  // this will handle the change the change in value of counter
  final StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

  // we can directly use the counter sink from widget itself but to reduce the logic
  // from the UI files we are making use of one more controller that will listen to
  // button click events by user.

  final StreamController<Event> _eventController = StreamController<Event>();
  StreamSink<Event> get eventSink => _eventController.sink;
  Stream<Event> get eventStream => _eventController.stream;

  // NOTE: here we will use listener to listen the _eventController
  StreamSubscription? listener;
  CounterController() {
    listener = eventStream.listen((Event event) {
      switch (event) {
        case Event.increment:
          counter += 1;

          break;
        case Event.decrement:
          counter -= 1;
          break;
        default:
      }
      counterSink.add(counter);
    });
  }
  // dispose the listner to eliminate memory leak
  dispose() {
    listener?.cancel();
    _counterController.close();
    _eventController.close();
  }
}

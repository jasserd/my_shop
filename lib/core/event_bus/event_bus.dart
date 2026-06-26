import 'dart:async';

export 'events/events.dart';

class EventBus {
  final _controller = StreamController<Object>.broadcast();

  Stream<T> on<T extends Object>() {
    return _controller.stream.where((event) => event is T).cast<T>();
  }

  void publish(Object event) {
    _controller.add(event);
  }
}

final appEventBus = EventBus();

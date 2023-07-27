import 'package:rxdart/rxdart.dart';

/// Handles state related to the number being counted
class CounterBloc {
  CounterBloc() {
    counterSubject = BehaviorSubject<int>.seeded(0);
  }

  late final BehaviorSubject<int> counterSubject;

  /// Increments the value of [counterSubject] by one.
  void increment() => counterSubject.value++;

  /// Decrements the value of [counterSubject] by one.
  void decrement() => counterSubject.value--;

  void close() => counterSubject.close();
}

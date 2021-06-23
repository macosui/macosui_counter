import 'package:rxdart/rxdart.dart';

/// Handles state related to the number being counted
class CounterBloc {
  final counterSubject = BehaviorSubject<int>.seeded(0);

  void increment() => counterSubject.value++;

  void decrement() => counterSubject.value--;

  void close() => counterSubject.close();
}

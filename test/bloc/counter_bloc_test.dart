import 'package:flutter_test/flutter_test.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';

void main() {
  test('Test initial value', () async {
    CounterBloc counterBloc = CounterBloc();
    await expectLater(counterBloc.counterSubject.value, 0);
  });

  test('Test increment initial value by one', () {
    CounterBloc counterBloc = CounterBloc();
    counterBloc.increment();
    expect(counterBloc.counterSubject.value, 1);
  });

  test('Test decrement initial value by one', () {
    CounterBloc counterBloc = CounterBloc();
    counterBloc.decrement();
    expect(counterBloc.counterSubject.value, -1);
  });
}

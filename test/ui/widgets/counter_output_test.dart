import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macosui_counter/bloc/counter_bloc.dart';
import 'package:macosui_counter/ui/widgets/counter_output.dart';
import 'package:macosui_counter/ui/widgets/counter_text.dart';
import 'package:provider/provider.dart';

void main() {
  late CounterBloc bloc;

  setUpAll(() {
    bloc = CounterBloc();
  });

  testWidgets('test counter output widget', (WidgetTester tester) async {
    await tester.pumpWidget(
        _makeWidgetTestableWithProvider<CounterBloc>(bloc, const CounterOutput(),),);

    expect(find.byType(CounterText), findsOneWidget);
  });

  testWidgets('test counter output widget with value',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        _makeWidgetTestableWithProvider<CounterBloc>(bloc, const CounterOutput(),),);

    expect(find.text('0'), findsOneWidget);

    final finder = find.byType(CounterText);
    final CounterText counterText = tester.firstWidget(finder);
    expect(counterText.count, 0);
  });

  testWidgets('counter output should increase as increment method is called',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _makeWidgetTestableWithProvider<CounterBloc>(
        bloc,
        const CounterOutput(),
      ),
    );

    expect(find.text('0'), findsOneWidget);

    bloc.increment();
    await tester.pumpAndSettle();

    final finder = find.byType(CounterText);
    final CounterText counterText = tester.firstWidget(finder);

    expect(counterText.count, 1);
  });

  testWidgets('counter output should increase as decrement method is called',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _makeWidgetTestableWithProvider<CounterBloc>(
            bloc,
            const CounterOutput(),
          ),
        );

        expect(find.text('1'), findsOneWidget);

        bloc.decrement();
        await tester.pumpAndSettle();

        final finder = find.byType(CounterText);
        final CounterText counterText = tester.firstWidget(finder);

        expect(counterText.count, 0);
      });
}

Widget _makeWidgetTestableWithProvider<T>(T value, Widget child) {
  return MaterialApp(
    builder: (context, child) => Provider.value(
      value: value,
      child: child,
    ),
    home: child,
  );
}

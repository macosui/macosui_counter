import 'package:flutter/widgets.dart';

class InfoText extends StatelessWidget {
  const InfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'This is a sample application meant to demonstrate how to architect '
      'a native-looking multi-platform Flutter application.',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MyWidget widget test', (tester) async {
    // Test code goes here.
    await tester.pumpWidget(const MyWidget(
      title: 'Test',
      message: 'Message',
    ));

    // Create the Finders.
    final titleFinderSuccess = find.text('Test');
    final titleSuccessFail = find.text('zzz');
    final messageFinderSuccess = find.text('Message');
    final messageFinderFail = find.text('zzz');

    expect(titleFinderSuccess, findsOneWidget);
    expect(titleSuccessFail, findsNothing);

    expect(messageFinderSuccess, findsOneWidget);
    expect(messageFinderFail, findsNothing);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}

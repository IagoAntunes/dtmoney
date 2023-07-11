import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dtmoney/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('description', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    final passwordField = find.byKey(Key('senhaTextField'));

    await tester.enterText(
      find.byKey(Key('emailTextField')),
      'example@example.com',
    );
    await tester.enterText(
      passwordField,
      'password123',
    );

    final button = find.byKey(Key('signButton'));
    await tester.tap(find.byKey(Key('signButton')));
    await tester.pumpAndSettle();

    expect(find.text('DT Money'), findsOneWidget);
  });
}

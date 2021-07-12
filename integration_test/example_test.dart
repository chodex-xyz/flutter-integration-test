import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("failing test example", (WidgetTester tester) async {
    app.main();
    expect(2 + 2, equals(4));

    await tester.pumpAndSettle();

    // Finds the floating action button to tap on.
    final Finder fab = find.byTooltip('Increment');

    // Emulate a tap on the floating action button.
    await tester.tap(fab);

    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
  });
}

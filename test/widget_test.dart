import 'package:flexpay_app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App boots and shows onboarding copy',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FlexPayApp());
    await tester.pumpAndSettle();

    expect(find.text('Your Behavior is Your Password'), findsOneWidget);
  });
}

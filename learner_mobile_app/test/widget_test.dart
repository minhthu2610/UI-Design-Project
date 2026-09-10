import 'package:flutter_test/flutter_test.dart';

import 'package:learner_mobile_app/main.dart';

void main() {
  testWidgets('App initialization test', (WidgetTester tester) async {
    await tester.pumpWidget(const LearnerElearningApp());
    expect(find.byType(LearnerElearningApp), findsOneWidget);
  });
}

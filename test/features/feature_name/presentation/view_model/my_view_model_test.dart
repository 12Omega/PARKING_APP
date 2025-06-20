import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parking_app/features/home/presentation/view/dashboard_view.dart';

void main() {
  testWidgets('DashboardScreen loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));

    expect(find.text('Dashboard'), findsOneWidget);
  });
}

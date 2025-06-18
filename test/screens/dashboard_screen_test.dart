import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parking_app/screens/dashboard_screen.dart';
// import 'package:parking_app/screens/home_screen.dart'; // For checking initial content - Removed

void main() {
  group('DashboardScreen Tests', () {
    testWidgets('Initial screen content and BottomNavigationBar', (WidgetTester tester) async {
      // Wrap DashboardScreen in MaterialApp for context
      await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));

      // Wait for any animations to settle, especially for the Navigator
      await tester.pumpAndSettle();

      // Expect to find HomeScreen content initially because DashboardRoutes.home
      // in the nested navigator maps to HomeScreen.
      expect(find.text('Home Screen Content'), findsOneWidget);

      // Expect to find the BottomNavigationBar
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Expect the Home tab to be selected (index 0)
      final BottomNavigationBar bnb = tester.widget(find.byType(BottomNavigationBar));
      expect(bnb.currentIndex, 0);

      // Expect to find the AppBar
      expect(find.widgetWithText(AppBar, 'Parking App Dashboard'), findsOneWidget);
    });

    testWidgets('Tab navigation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));
      await tester.pumpAndSettle();

      // Initial state: Home tab selected, Home content visible
      expect(find.text('Home Screen Content'), findsOneWidget);
      BottomNavigationBar bnb = tester.widget(find.byType(BottomNavigationBar));
      expect(bnb.currentIndex, 0);

      // Tap the 'Bookings' tab icon (Icons.local_parking)
      await tester.tap(find.byIcon(Icons.local_parking));
      await tester.pumpAndSettle(); // Allow time for navigation

      // Expect BookingsScreen content, Home content should be gone
      expect(find.text('Bookings Screen Content'), findsOneWidget);
      expect(find.text('Home Screen Content'), findsNothing);
      bnb = tester.widget(find.byType(BottomNavigationBar));
      expect(bnb.currentIndex, 1); // Bookings tab is index 1

      // Tap the 'Profile' tab icon (Icons.person)
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      // Expect ProfileScreen content, Bookings content should be gone
      expect(find.text('Profile Screen Content'), findsOneWidget);
      expect(find.text('Bookings Screen Content'), findsNothing);
      bnb = tester.widget(find.byType(BottomNavigationBar));
      expect(bnb.currentIndex, 2); // Profile tab is index 2

      // Tap the 'Home' tab icon (Icons.home)
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      // Expect HomeScreen content, Profile content should be gone
      expect(find.text('Home Screen Content'), findsOneWidget);
      expect(find.text('Profile Screen Content'), findsNothing);
      bnb = tester.widget(find.byType(BottomNavigationBar));
      expect(bnb.currentIndex, 0); // Home tab is index 0
    });
  });
}

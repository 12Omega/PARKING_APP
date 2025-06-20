import 'package:flutter/material.dart';
import 'package:parking_app/routes/dashboard_router.dart'; // Updated import
import 'package:parking_app/screens/home_screen.dart';
import 'package:parking_app/screens/bookings_screen.dart';
import 'package:parking_app/screens/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _onTabTapped(int index) {
    // Update the selected index to highlight the tab in BottomNavigationBar
    setState(() {
      _selectedIndex = index;
    });

    // Navigate using the nested Navigator
    switch (index) {
      case 0:
        _navigatorKey.currentState?.pushReplacementNamed(DashboardRoutes.home);
        break;
      case 1:
        _navigatorKey.currentState?.pushReplacementNamed(
          DashboardRoutes.bookings,
        );
        break;
      case 2:
        _navigatorKey.currentState?.pushReplacementNamed(
          DashboardRoutes.profile,
        );
        break;
    }
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DashboardRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case DashboardRoutes.bookings:
        return MaterialPageRoute(
          builder: (_) => const BookingsScreen(),
          settings: settings,
        );
      case DashboardRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      default:
        // Fallback to HomeScreen or handle error
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parking App Dashboard"),
        centerTitle: true,
      ), // AppBar remains
      body: Navigator(
        key: _navigatorKey,
        initialRoute: DashboardRoutes.home,
        onGenerateRoute: _onGenerateRoute,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_parking,
            ), // Changed from Icons.list to Icons.local_parking
            label: "Bookings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

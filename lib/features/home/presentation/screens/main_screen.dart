import 'package:flutter/material.dart';
import 'package:real_estate/features/favs/presentation/screens/fav_screen.dart';
import 'package:real_estate/features/home/presentation/screens/home_view.dart';
import 'package:real_estate/features/map/presentation/pages/property_map_page.dart';
import 'package:real_estate/features/profile_page/presentation/pages/profile_page.dart';
import 'package:real_estate/features/home/presentation/widgets/custom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),        // Index 0 -> دي صفحة الهوم بتاعتك اللي من غير Scaffold
    const FavoritesScreen(),   // Index 1
    const PropertyMapPage(),   // Index 2
    const Scaffold(body: Center(child: Text('History Page'))), // Index 3 (أو شاشة الـ History بتاعتك)
    const ProfilePage(),       // Index 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // دي اللي بتخلي الـ NavBar يغير الشاشة صح
          });
        },
      ),
    );
  }
}
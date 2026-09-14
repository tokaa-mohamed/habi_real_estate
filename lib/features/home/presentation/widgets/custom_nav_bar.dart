import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent, 
                    elevation: 0, 
                              selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.black.withOpacity(0.4),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          items: [
             BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/home-icon.svg', width: 24, height: 24),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/favourite.svg', width: 24, height: 24),
              activeIcon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/chat-icon.svg', width: 24, height: 24),
              activeIcon: Icon(Icons.map),
              label: 'Map',
            ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/history-icon.svg', width: 24, height: 24),
              activeIcon: Icon(Icons.history),
              label: 'History',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
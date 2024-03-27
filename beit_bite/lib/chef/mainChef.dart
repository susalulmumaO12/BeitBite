import 'package:beit_bite/customer/provider.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});

class mainChef extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);

    final bodies = [
      const Center(
        child: Text('Hello From Home'),
      ),
      const Center(
        child: Text('Hello From Favorite'),
      ),
      const Center(
        child: Text('Hello From dishes'),
      ),
      const Center(
        child: Text('Hello From starred'),
      ),
      const Center(
        child: Text('Hello From Settings'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFF153F54),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: bodies[indexBottomNavbar],
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.home),
              label: 'Home',
              backgroundColor: Color(0xFF153F54),
            ),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.chefHat), label: 'Chefs'),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.clipboardList), label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.utensils), label: 'Dishes'),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.menu), label: 'Options'),
          ],
          selectedItemColor: Color(0xFFFFA07A),
          selectedIconTheme: IconThemeData(color: Color(0xFFFFA07A)),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
          unselectedItemColor: Color(0xFFFFFFFF),
          unselectedIconTheme: IconThemeData(
            color: Color(0xFFFFFFFF),
          ),
          currentIndex: indexBottomNavbar,
          onTap: (value) => ref
              .read(indexBottomNavbarProvider.notifier)
              .update((state) => value)),
    );
  }
}

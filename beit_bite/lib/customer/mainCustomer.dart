import 'package:beit_bite/customer/provider.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SegmentControl { dishes, chefs }

final segmentControlProvider =
    StateProvider<SegmentControl>((ref) => SegmentControl.dishes);

class mainCustomer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segmentControl = ref.watch(segmentControlProvider);
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
            color: Color(0xFFFFA07A),
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
              backgroundColor: Color(0xFFFFA07A),
            ),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.chefHat), label: 'Chefs'),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.utensils), label: 'Table'),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.star), label: 'Starred'),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.menu), label: 'Options'),
          ],
          selectedItemColor: Color(0xFF153F54),
          selectedIconTheme: IconThemeData(color: Color(0xFF153F54)),
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

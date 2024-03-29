import 'package:beit_bite/customer/homeCustomer.dart';
import 'package:beit_bite/customer/provider.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});

class mainCustomer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);

    final bodies = [
      Center(
        child: homeCustomer(),
      ),
      Center(
        child: Text('Hello From Favorite'),
      ),
      Center(
        child: Text('Hello From dishes'),
      ),
      Center(
        child: Text('Hello From starred'),
      ),
      Center(
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
        title: Container(
          color: Colors.white,
          child: TextFormField(
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (value) {},
            onEditingComplete: () {},
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
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
                icon: Icon(LucideIcons.cakeSlice), label: 'Table'),
            BottomNavigationBarItem(
                icon: Icon(LucideIcons.utensils), label: 'Dishes'),
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

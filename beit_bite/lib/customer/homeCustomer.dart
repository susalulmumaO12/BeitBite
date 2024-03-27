import 'package:beit_bite/customer/dishdetails.dart';
import 'package:beit_bite/main.dart';
import 'package:beit_bite/models/dishService.dart';
import 'package:beit_bite/models/dishmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDishProvider =
    StateProvider<Dish>((ref) => throw UnimplementedError());

class homeCustomer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishesAsyncValue = ref.watch(dishesProvider);
    final navigationService = ref.watch(navigationProvider);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recommended',
              style: TextStyle(
                color: Color(0xFF153F54),
                fontFamily: 'Bubblegum',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          dishesAsyncValue.when(
            data: (dishes) {
              return CarouselSlider.builder(
                itemCount: dishes.length,
                itemBuilder: (context, index, realIdx) {
                  final dish = dishes[index];
                  return GestureDetector(
                    child: Stack(
                      children: [Text(dish.name), Image.asset(dish.imagePath)],
                    ),
                    onTap: () {
                      ref.read(selectedDishProvider.notifier).state = dish;
                      navigationService.navigateTo('dishdetails');
                    },
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                ),
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Color(0xFF153F54),
                fontFamily: 'Bubblegum',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

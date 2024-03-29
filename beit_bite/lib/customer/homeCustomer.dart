import 'package:beit_bite/customer/dishdetailspreview.dart';
import 'package:beit_bite/main.dart';
import 'package:beit_bite/models/categoriesService.dart';
import 'package:beit_bite/models/catmodel.dart';
import 'package:beit_bite/models/dishService.dart';
import 'package:beit_bite/models/dishmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

final selectedDishProvider =
    StateProvider<Dish>((ref) => throw UnimplementedError());

final selectedCatProvider =
    StateProvider<categoryModel>((ref) => throw UnimplementedError());

class homeCustomer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishesAsyncValue = ref.watch(dishesProvider);
    final catAsyncValue = ref.watch(catProvider);
    final navigationService = ref.watch(navigationProvider);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
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
          Container(
            height: 200,
            width: screenSize.width,
            child: dishesAsyncValue.when(
              data: (dishes) {
                return CarouselSlider.builder(
                  itemCount: dishes.length,
                  itemBuilder: (context, index, realIdx) {
                    final dish = dishes[index];
                    return GestureDetector(
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset(dish.imagePath)),
                            Text(dish.name),
                            Text(dish.chefName)
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                title: Text(
                                  'Dish details preview',
                                  style: TextStyle(
                                    color: Color(0xFF153F54),
                                    fontFamily: 'Bubblegum',
                                    fontSize: screenSize.width / 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                surfaceTintColor: Colors.white,
                                children: [
                                  Container(
                                    width: screenSize.width * 0.8,
                                    height: screenSize.height * 0.4,
                                    child: Consumer(
                                        builder: (context, ref, child) {
                                      final selectedDish = dish;
                                      return dishdetailsPreview(
                                          dish: selectedDish);
                                    }),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        final selectedDish = dish;
                                        navigationService.navigateTo(
                                            '/dishdetails',
                                            arguments: selectedDish);
                                      },
                                      icon: Icon(Icons.info))
                                ],
                              );
                            });
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
          ),
          SizedBox(
            height: 20,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: catAsyncValue.when(
                data: (cats) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: cats.length,
                    itemBuilder: (context, index) {
                      final cat = cats[index];
                      return Stack(
                        children: [
                          Card(
                            child: Image.asset(cat.imagePath),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              cat.name,
                              style: TextStyle(
                                color: Color(0xFF153F54),
                                fontFamily: 'Bubblegum',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                error: (err, stack) => Text('Error: $err'),
                loading: () => CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
